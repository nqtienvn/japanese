package com.mb.security.jwt;

import com.mb.security.config.SecurityProperties;
import com.mb.security.util.SecurityConstants;
import io.jsonwebtoken.*;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.stereotype.Component;

import javax.crypto.SecretKey;
import java.nio.charset.StandardCharsets;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

/**
 * JWT Token Provider (Java 21 + Spring Security 6)
 * Modern implementation with Records and Pattern Matching
 */
@Slf4j
@Component
public class JwtTokenProvider implements InitializingBean {
    
    private final SecurityProperties properties;
    private final UserDetailsService userDetailsService;
    
    private SecretKey key;
    private JwtParser jwtParser;
    
    public JwtTokenProvider(SecurityProperties properties, UserDetailsService userDetailsService) {
        this.properties = properties;
        this.userDetailsService = userDetailsService;
    }
    
    @Override
    public void afterPropertiesSet() {
        String secret = properties.jwt().secret();
        
        if (secret == null || secret.isBlank()) {
            throw new IllegalStateException(
                "JWT secret must be configured in mb.security.jwt.secret"
            );
        }
        
        byte[] keyBytes = isBase64(secret) 
            ? Decoders.BASE64.decode(secret)
            : secret.getBytes(StandardCharsets.UTF_8);
        
        this.key = Keys.hmacShaKeyFor(keyBytes);
        this.jwtParser = Jwts.parser()
            .verifyWith(key)
            .build();
        
        log.info("JWT Token Provider initialized with HS512 algorithm");
    }
    
    /**
     * Create access token and CSRF token pair
     */
    public JwtAccessToken createAccessToken(String username, boolean rememberMe) {
        int duration = rememberMe 
            ? properties.jwt().refreshTokenExpiration()
            : properties.jwt().accessTokenExpiration();
        
        var accessToken = createToken(username, duration, SecurityConstants.TokenType.ACCESS_TOKEN);
        var csrfToken = createToken(username, duration, SecurityConstants.TokenType.CSRF_TOKEN);
        
        return new JwtAccessToken(accessToken, csrfToken);
    }
    
    /**
     * Create access token with default expiration
     */
    public JwtAccessToken createAccessToken(String username) {
        return createAccessToken(username, false);
    }
    
    /**
     * Create refresh token
     */
    public JwtToken createRefreshToken(String username) {
        int duration = properties.jwt().refreshTokenExpiration();
        return createToken(username, duration, SecurityConstants.TokenType.REFRESH_TOKEN);
    }
    
    /**
     * Validate access token and CSRF token
     */
    public boolean validateToken(String accessToken, String csrfToken) {
        try {
            var accessClaims = jwtParser.parseSignedClaims(accessToken).getPayload();
            var csrfClaims = jwtParser.parseSignedClaims(csrfToken).getPayload();
            
            // Verify usernames match
            if (!accessClaims.getSubject().equals(csrfClaims.getSubject())) {
                log.error("Token username mismatch");
                return false;
            }
            
            // Verify token types
            String accessType = accessClaims.get(SecurityConstants.Claim.TOKEN_TYPE, String.class);
            String csrfType = csrfClaims.get(SecurityConstants.Claim.TOKEN_TYPE, String.class);
            
            return SecurityConstants.TokenType.ACCESS_TOKEN.value().equals(accessType) &&
                   SecurityConstants.TokenType.CSRF_TOKEN.value().equals(csrfType);
                   
        } catch (ExpiredJwtException e) {
            log.error("Token has expired", e);
            return false;
        } catch (Exception e) {
            log.error("Token validation failed", e);
            return false;
        }
    }
    
    /**
     * Validate refresh token
     */
    public boolean validateRefreshToken(String refreshToken) {
        try {
            var claims = jwtParser.parseSignedClaims(refreshToken).getPayload();
            String tokenType = claims.get(SecurityConstants.Claim.TOKEN_TYPE, String.class);
            return SecurityConstants.TokenType.REFRESH_TOKEN.value().equals(tokenType);
        } catch (Exception e) {
            log.error("Refresh token validation failed", e);
            return false;
        }
    }
    
    /**
     * Get authentication from token
     */
    public Authentication getAuthentication(String token) {
        var claims = jwtParser.parseSignedClaims(token).getPayload();
        String username = claims.getSubject();
        
        UserDetails userDetails = userDetailsService.loadUserByUsername(username);
        
        return new UsernamePasswordAuthenticationToken(
            userDetails, 
            token, 
            userDetails.getAuthorities()
        );
    }
    
    /**
     * Parse token claims
     */
    public Claims parseToken(String token) {
        try {
            return jwtParser.parseSignedClaims(token).getPayload();
        } catch (Exception e) {
            log.error("Failed to parse token", e);
            return null;
        }
    }
    
    /**
     * Get username from token
     */
    public String getUsernameFromToken(String token) {
        var claims = parseToken(token);
        return claims != null ? claims.getSubject() : null;
    }
    
    // ========== Private Helper Methods ==========
    
    private JwtToken createToken(String username, int duration, SecurityConstants.TokenType tokenType) {
        Map<String, Object> claims = new HashMap<>();
        claims.put(SecurityConstants.Claim.TOKEN_TYPE, tokenType.value());
        
        return createToken(username, duration, claims);
    }
    
    private JwtToken createToken(String username, int duration, Map<String, Object> claims) {
        var now = new Date();
        var expiration = new Date(now.getTime() + (duration * 1000L));
        
        String jwt = Jwts.builder()
            .subject(username)
            .claims(claims)
            .issuer(properties.jwt().issuer())
            .issuedAt(now)
            .expiration(expiration)
            .signWith(key, Jwts.SIG.HS512)
            .compact();
        
        return new JwtToken(jwt, duration);
    }
    
    private boolean isBase64(String str) {
        try {
            Decoders.BASE64.decode(str);
            return true;
        } catch (Exception e) {
            return false;
        }
    }
}
