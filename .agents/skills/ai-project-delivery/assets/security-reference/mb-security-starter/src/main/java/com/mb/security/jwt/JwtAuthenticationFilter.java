package com.mb.security.jwt;

import com.mb.security.util.SecurityConstants;
import jakarta.servlet.FilterChain;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.util.StringUtils;
import org.springframework.web.filter.OncePerRequestFilter;

import java.io.IOException;
import java.util.Arrays;

/**
 * JWT Authentication Filter (Java 21 + Jakarta Servlet)
 * Extracts and validates JWT tokens from cookies and headers
 */
@Slf4j
public class JwtAuthenticationFilter extends OncePerRequestFilter {
    
    private final JwtTokenProvider jwtTokenProvider;
    
    public JwtAuthenticationFilter(JwtTokenProvider jwtTokenProvider) {
        this.jwtTokenProvider = jwtTokenProvider;
    }
    
    @Override
    protected void doFilterInternal(
        HttpServletRequest request,
        HttpServletResponse response,
        FilterChain filterChain
    ) throws ServletException, IOException {
        
        try {
            String accessToken = extractAccessTokenFromCookie(request);
            String csrfToken = extractCsrfTokenFromHeader(request);
            
            if (StringUtils.hasText(accessToken) && StringUtils.hasText(csrfToken)) {
                if (jwtTokenProvider.validateToken(accessToken, csrfToken)) {
                    Authentication authentication = jwtTokenProvider.getAuthentication(accessToken);
                    SecurityContextHolder.getContext().setAuthentication(authentication);
                    
                    log.debug("Set authentication for user: {}", authentication.getName());
                }
            }
        } catch (Exception e) {
            log.error("Cannot set user authentication", e);
        }
        
        filterChain.doFilter(request, response);
    }
    
    /**
     * Extract access token from cookie using Java 21 features
     */
    private String extractAccessTokenFromCookie(HttpServletRequest request) {
        Cookie[] cookies = request.getCookies();
        
        if (cookies == null) {
            return null;
        }
        
        return Arrays.stream(cookies)
            .filter(cookie -> SecurityConstants.Cookie.ACCESS_TOKEN.equals(cookie.getName()))
            .findFirst()
            .map(Cookie::getValue)
            .orElse(null);
    }
    
    /**
     * Extract CSRF token from Authorization header
     */
    private String extractCsrfTokenFromHeader(HttpServletRequest request) {
        String bearerToken = request.getHeader(SecurityConstants.Header.AUTHORIZATION);
        
        if (StringUtils.hasText(bearerToken) && 
            bearerToken.startsWith(SecurityConstants.Header.BEARER_PREFIX)) {
            return bearerToken.substring(SecurityConstants.Header.BEARER_PREFIX.length());
        }
        
        return null;
    }
}
