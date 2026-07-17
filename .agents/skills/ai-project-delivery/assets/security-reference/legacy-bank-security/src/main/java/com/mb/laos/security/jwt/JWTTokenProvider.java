package com.mb.laos.security.jwt;

import com.mb.laos.api.exception.BadRequestAlertException;
import com.mb.laos.api.exception.UnauthorizedException;
import com.mb.laos.api.util.ErrorCode;
import com.mb.laos.cache.CacheProperties;
import com.mb.laos.messages.LabelKey;
import com.mb.laos.messages.Labels;
import com.mb.laos.security.AbstractUserPrincipal;
import com.mb.laos.security.configuration.AuthenticationProperties;
import com.mb.laos.security.util.SecurityConstants;
import com.mb.laos.service.TokenService;
import com.mb.laos.util.DateUtil;
import com.mb.laos.util.GetterUtil;
import com.mb.laos.util.StringPool;
import com.mb.laos.util.Validator;
import io.jsonwebtoken.Claims;
import io.jsonwebtoken.ExpiredJwtException;
import io.jsonwebtoken.JwtParser;
import io.jsonwebtoken.Jwts;
import io.jsonwebtoken.MalformedJwtException;
import io.jsonwebtoken.SignatureAlgorithm;
import io.jsonwebtoken.UnsupportedJwtException;
import io.jsonwebtoken.io.Decoders;
import io.jsonwebtoken.security.Keys;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.http.HttpCookie;
import org.springframework.http.ResponseCookie;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import javax.servlet.http.Cookie;
import java.nio.charset.StandardCharsets;
import java.security.Key;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

@Slf4j
@Component
@RequiredArgsConstructor
public class JWTTokenProvider<T extends AbstractUserPrincipal> implements InitializingBean {
    private Key key;

    private final AuthenticationProperties properties;

    private final UserDetailsService userDetailsService;

    private final CacheProperties cacheProperties;

    private final TokenService tokenService;

    private JwtParser jwtParser;

    private Map<String, Integer> timeToLives;

    @Override
    public void afterPropertiesSet() throws Exception {
        byte[] keyBytes;

        String secret = properties.getBase64Secret();

        if (Validator.isNull(secret)) {
            _log.warn("Warning: the JWT key used is not Base64-encoded. "
                    + "We recommend using the `spring.security.authentication.jwt.base64-secret` key for optimum security.");

            keyBytes = secret.getBytes(StandardCharsets.UTF_8);
        } else {
            _log.info("Using a Base64-encoded JWT secret key");

            keyBytes = Decoders.BASE64.decode(secret);
        }

        this.key = Keys.hmacShaKeyFor(keyBytes);

        // jwt parser
        this.jwtParser = Jwts.parserBuilder().setSigningKey(key).build();

        // get timeToLives map
        this.timeToLives = this.cacheProperties.getTimeTolives();
    }

    // access token

    public Cookie clearCookie(String key) {
        Cookie cookie = new Cookie(key, StringPool.BLANK);

        cookie.setPath("/");
        cookie.setMaxAge(0);
        cookie.setHttpOnly(true);
        cookie.setSecure(true);

        return cookie;
    }

    public HttpCookie clearHttpCookie(String key) {

        return ResponseCookie.from(key, StringPool.BLANK)
                .maxAge(0)
                .httpOnly(properties.isHttpOnly())
                .path(properties.getPath())
                .secure(properties.isEnableSsl())
                .sameSite(properties.getSameSite())
                .build();
    }

    public JWTAccessToken createAccessToken(String username, boolean rememberMe) {
        try {
            int duration =
                    GetterUtil.getIntegerValue(
                            rememberMe ? timeToLives.get(SecurityConstants.Cache.REMEMBER_ME_TOKEN)
                                    : timeToLives.get(SecurityConstants.Cache.TOKEN),
                            0);

            JWTToken accessToken = createToken(username, duration, SecurityConstants.TokenType.ACCESS_TOKEN);

            JWTToken csrfToken = createToken(username, duration, SecurityConstants.TokenType.CSRF_TOKEN);

            JWTAccessToken jwtAccessToken =
                    JWTAccessToken.builder().accessToken(accessToken).csrfToken(csrfToken).build();

            // invalidate token
            this.tokenService.invalidateToken(username);

            // save token
            if (rememberMe) {
                this.tokenService.saveRememberMeToken(username, jwtAccessToken);
            } else {
                this.tokenService.saveToken(username, jwtAccessToken);
            }

            return jwtAccessToken;
        } catch (UsernameNotFoundException e) {
            _log.error(Labels.getLabels(LabelKey.ERROR_INVALID_USERNAME_OR_PASSWORD));

            throw new BadRequestAlertException(Labels.getLabels(LabelKey.ERROR_INVALID_USERNAME_OR_PASSWORD),
                    SecurityConstants.Header.TOKEN, LabelKey.ERROR_INVALID_USERNAME_OR_PASSWORD);
        }
    }

    public JWTAccessToken createAccessTokenClient(String username, boolean rememberMe) {
        try {
            int duration =
                    GetterUtil.getIntegerValue(
                            rememberMe ? timeToLives.get(SecurityConstants.Cache.REMEMBER_ME_TOKEN)
                                    : timeToLives.get(SecurityConstants.Cache.TOKEN),
                            0);

            JWTToken accessToken = createToken(username, duration, SecurityConstants.TokenType.ACCESS_TOKEN);

            JWTToken csrfToken = createToken(username, duration, SecurityConstants.TokenType.CSRF_TOKEN);

            JWTAccessToken jwtAccessToken =
                    JWTAccessToken.builder().accessToken(accessToken).csrfToken(csrfToken).build();

            return jwtAccessToken;
        } catch (UsernameNotFoundException e) {
            _log.error(Labels.getLabels(LabelKey.ERROR_INVALID_USERNAME_OR_PASSWORD));

            throw new BadRequestAlertException(Labels.getLabels(LabelKey.ERROR_INVALID_USERNAME_OR_PASSWORD),
                    SecurityConstants.Header.TOKEN, LabelKey.ERROR_INVALID_USERNAME_OR_PASSWORD);
        }
    }

    /*
     * Create refresh token
     */

    public JWTAccessToken createAccessToken(String username) {
        try {
            int duration = GetterUtil.getIntegerValue(timeToLives.get(SecurityConstants.Cache.TOKEN), 0);

            JWTToken accessToken = createToken(username, duration, SecurityConstants.TokenType.ACCESS_TOKEN);
            JWTToken csrfToken = createToken(username, duration, SecurityConstants.TokenType.CSRF_TOKEN);

            JWTAccessToken jwtAccessToken =
                    JWTAccessToken.builder().accessToken(accessToken).csrfToken(csrfToken).build();

            // invalidate token
            this.tokenService.invalidateToken(username);

            // save token
            this.tokenService.saveToken(username, jwtAccessToken);

            return jwtAccessToken;
        } catch (UsernameNotFoundException e) {
            _log.error(Labels.getLabels(LabelKey.ERROR_INVALID_USERNAME_OR_PASSWORD));

            throw new BadRequestAlertException(Labels.getLabels(LabelKey.ERROR_INVALID_USERNAME_OR_PASSWORD),
                    SecurityConstants.Header.TOKEN, LabelKey.ERROR_INVALID_USERNAME_OR_PASSWORD);
        }
    }

    public Cookie createCookie(String key, String value) {
        Cookie cookie = new Cookie(key, value);

        cookie.setPath("/");
        cookie.setHttpOnly(true);
        cookie.setSecure(true);

        return cookie;
    }

    public HttpCookie createHttpCookie(String key, String value, int duration) {

        return ResponseCookie.from(key, value)
                .maxAge(duration)
                .httpOnly(properties.isHttpOnly())
                .path(properties.getPath())
                .secure(properties.isEnableSsl())
                .sameSite(properties.getSameSite())
                .build();
    }

    public JWTToken createRefreshToken(String username) {
//        int duration = GetterUtil.getIntegerValue(timeToLives.get(SecurityConstants.Cache.REFRESH_TOKEN), 0);

        JWTToken token = createRefreshToken(username, SecurityConstants.TokenType.REFRESH_TOKEN);

        // save refresh token
        this.tokenService.saveRefreshToken(username, token);

        return token;
    }

    public Authentication getAuthentication(String token) {
        Claims claims = jwtParser.parseClaimsJws(token).getBody();

        String username = claims.getSubject();

        T principal = (T) userDetailsService.loadUserByUsername(username);

        if (Validator.isNull(principal)) {
            return null;
        }

        return new UsernamePasswordAuthenticationToken(principal, token, principal.getAuthorities());
    }

    public void invalidateToken(String username) {
        this.tokenService.invalidateToken(username);
    }

    public void invalidateCsrfToken(String username) {
        this.tokenService.invalidateCsrfToken(username);
    }

    public boolean validateToken(String accessToken, String csrfToken) {
        String username = StringPool.BLANK;

        try {
            Claims claims = jwtParser.parseClaimsJws(accessToken).getBody();

            username = claims.getSubject();

            if (Validator.isNull(username)) {
                _log.error("username is empty");

                throw new UnauthorizedException(Labels.getLabels(LabelKey.ERROR_INVALID_TOKEN),
                        SecurityConstants.Header.TOKEN, LabelKey.ERROR_INVALID_TOKEN);
            }

            JWTAccessToken token = this.tokenService.getToken(username);

            if (Validator.isNull(token)) {
                token = this.tokenService.getRememberMeToken(username);
            }

            if (Validator.isNull(token) || Validator.isNull(token.getAccessToken())
                    || Validator.isNull(token.getCsrfToken())) {
                return false;
            }

            return Validator.equals(accessToken, token.getAccessToken().getToken())
                    && Validator.equals(csrfToken, token.getCsrfToken().getToken());
        } catch (MalformedJwtException ex) {
            _log.error("Access token malformed");

            throw new UnauthorizedException(Labels.getLabels(LabelKey.ERROR_TOKEN_MALFORMED),
                    SecurityConstants.Header.TOKEN, LabelKey.ERROR_TOKEN_MALFORMED);

        } catch (ExpiredJwtException ex) {
            _log.error("Access token has expired");

            throw new UnauthorizedException(Labels.getLabels(LabelKey.ERROR_TOKEN_HAS_EXPIRED),
                    SecurityConstants.Header.TOKEN, LabelKey.ERROR_TOKEN_HAS_EXPIRED);

        } catch (UnsupportedJwtException ex) {
            _log.error("Unsupported JWT token");

            throw new UnauthorizedException(Labels.getLabels(LabelKey.ERROR_JWT_TOKEN_IS_UNSUPPORTED),
                    SecurityConstants.Header.TOKEN, LabelKey.ERROR_JWT_TOKEN_IS_UNSUPPORTED);

        } catch (IllegalArgumentException ex) {
            _log.error("JWT claims string is empty.");

            throw new UnauthorizedException(Labels.getLabels(LabelKey.ERROR_INVALID_TOKEN),
                    SecurityConstants.Header.TOKEN, Labels.getLabels(LabelKey.ERROR_INVALID_TOKEN));
        } catch (Exception e) {
            _log.error("Invalid JWT signature.", e);

            throw new UnauthorizedException(Labels.getLabels(LabelKey.ERROR_INVALID_TOKEN),
                    SecurityConstants.Header.TOKEN, LabelKey.ERROR_INVALID_TOKEN);
        }
    }

    public boolean validateTokenPublicKey(String token) {
        String username = StringPool.BLANK;

        try {
            Claims claims = Jwts.parserBuilder().setSigningKey(key).build().parseClaimsJws(token).getBody();

            username = claims.getSubject();

            if (Validator.isNull(username)) {
                _log.error("username is empty");

                throw new UnauthorizedException(Labels.getLabels(LabelKey.ERROR_INVALID_TOKEN),
                        SecurityConstants.Header.TOKEN, LabelKey.ERROR_INVALID_TOKEN);
            }

            if (!Validator.equals(username, "mbbank")) {
                throw new UnauthorizedException(Labels.getLabels(LabelKey.ERROR_INVALID_TOKEN),
                        SecurityConstants.Header.TOKEN, LabelKey.ERROR_INVALID_TOKEN);
            }

            if (this.isTokenExpired(claims)) {
                throw new UnauthorizedException(Labels.getLabels(LabelKey.ERROR_TOKEN_HAS_EXPIRED),
                        SecurityConstants.Header.TOKEN, LabelKey.ERROR_TOKEN_HAS_EXPIRED);
            }

            return true;
        } catch (MalformedJwtException ex) {
            _log.error("Access token malformed");

            throw new UnauthorizedException(Labels.getLabels(LabelKey.ERROR_TOKEN_MALFORMED),
                    SecurityConstants.Header.TOKEN, LabelKey.ERROR_TOKEN_MALFORMED);

        } catch (ExpiredJwtException ex) {
            _log.error("Access token has expired");

            throw new UnauthorizedException(Labels.getLabels(LabelKey.ERROR_TOKEN_HAS_EXPIRED),
                    SecurityConstants.Header.TOKEN, LabelKey.ERROR_TOKEN_HAS_EXPIRED);

        } catch (UnsupportedJwtException ex) {
            _log.error("Unsupported JWT token");

            throw new UnauthorizedException(Labels.getLabels(LabelKey.ERROR_JWT_TOKEN_IS_UNSUPPORTED),
                    SecurityConstants.Header.TOKEN, LabelKey.ERROR_JWT_TOKEN_IS_UNSUPPORTED);

        } catch (IllegalArgumentException ex) {
            _log.error("JWT claims string is empty.");

            throw new UnauthorizedException(Labels.getLabels(LabelKey.ERROR_INVALID_TOKEN),
                    SecurityConstants.Header.TOKEN, Labels.getLabels(LabelKey.ERROR_INVALID_TOKEN));
        } catch (Exception e) {
            _log.error("Invalid JWT signature.", e);

            throw new UnauthorizedException(Labels.getLabels(LabelKey.ERROR_INVALID_TOKEN),
                    SecurityConstants.Header.TOKEN, LabelKey.ERROR_INVALID_TOKEN);
        }
    }

    public Claims parseClaimsToken(String token) {
        try {
            return jwtParser.parseClaimsJws(token).getBody();
        } catch (Exception e) {
            _log.error("AccessToken is invalid {}.", e);

            return null;
        }
    }

    public String validateRefreshToken(String refreshToken, boolean changePw) {
        String username;
        ErrorCode errorCode = null;

        try {
            Claims claims = jwtParser.parseClaimsJws(refreshToken).getBody();

            username = claims.getSubject();

            if (Validator.isNull(username)) {
                _log.error("username is empty");

                throw new UnauthorizedException(Labels.getLabels(LabelKey.ERROR_INVALID_TOKEN),
                        SecurityConstants.Header.TOKEN, LabelKey.ERROR_INVALID_TOKEN);
            }

            JWTToken token = this.tokenService.getRefreshToken(username);

            if (Validator.isNull(token)) {
                token = this.tokenService.getFastLoginRefreshToken(username);
                errorCode = this.verifyTokenFastLogin(refreshToken, token, username);
            }

            if (Validator.isNull(token) || Validator.isNull(token.getToken())
                    || !Validator.equals(refreshToken, token.getToken())) {
                throw new UnauthorizedException(Labels.getLabels(LabelKey.ERROR_INVALID_TOKEN),
                        SecurityConstants.Header.TOKEN, Labels.getLabels(LabelKey.ERROR_INVALID_TOKEN));
            }

            return username;
        } catch (MalformedJwtException ex) {
            _log.error("Access token malformed");

            throw new UnauthorizedException(Labels.getLabels(LabelKey.ERROR_TOKEN_MALFORMED),
                    SecurityConstants.Header.TOKEN, LabelKey.ERROR_TOKEN_MALFORMED);

        } catch (ExpiredJwtException ex) {
            _log.error("Access token has expired");

            throw new UnauthorizedException(Labels.getLabels(LabelKey.ERROR_TOKEN_HAS_EXPIRED),
                    SecurityConstants.Header.TOKEN, LabelKey.ERROR_TOKEN_HAS_EXPIRED);

        } catch (UnsupportedJwtException ex) {
            _log.error("Unsupported JWT token");

            throw new UnauthorizedException(Labels.getLabels(LabelKey.ERROR_JWT_TOKEN_IS_UNSUPPORTED),
                    SecurityConstants.Header.TOKEN, LabelKey.ERROR_JWT_TOKEN_IS_UNSUPPORTED);

        } catch (IllegalArgumentException ex) {
            _log.error("JWT claims string is empty.");

            throw new UnauthorizedException(Labels.getLabels(LabelKey.ERROR_INVALID_TOKEN),
                    SecurityConstants.Header.TOKEN, Labels.getLabels(LabelKey.ERROR_INVALID_TOKEN));
        } catch (Exception e) {
            _log.error("Invalid JWT signature.");

            if (changePw) {
                throw new BadRequestAlertException(ErrorCode.MSG101230);
            } else if (Validator.isNotNull(errorCode)) {
                throw new BadRequestAlertException(errorCode);
            } else {
                throw new BadRequestAlertException(Labels.getLabels(LabelKey.ERROR_INVALID_TOKEN),
                        SecurityConstants.Header.TOKEN, LabelKey.ERROR_INVALID_TOKEN);
            }
        }
    }


    public String validateRefreshToken(String refreshToken) {
        String username = StringPool.BLANK;

        try {
            Claims claims = jwtParser.parseClaimsJws(refreshToken).getBody();

            username = claims.getSubject();

            if (Validator.isNull(username)) {
                _log.error("username is empty");

                throw new UnauthorizedException(Labels.getLabels(LabelKey.ERROR_INVALID_TOKEN),
                        SecurityConstants.Header.TOKEN, LabelKey.ERROR_INVALID_TOKEN);
            }

            JWTToken token = this.tokenService.getRefreshToken(username);

            if (Validator.isNull(token)) {
                token = this.tokenService.getFastLoginRefreshToken(username);
                this.verifyTokenFastLogin(refreshToken, token, username);
            }

            if (Validator.isNull(token) || Validator.isNull(token.getToken())
                    || !Validator.equals(refreshToken, token.getToken())) {
                throw new UnauthorizedException(Labels.getLabels(LabelKey.ERROR_INVALID_TOKEN),
                        SecurityConstants.Header.TOKEN, Labels.getLabels(LabelKey.ERROR_INVALID_TOKEN));
            }

            return username;
        } catch (MalformedJwtException ex) {
            _log.error("Access token malformed");

            throw new UnauthorizedException(Labels.getLabels(LabelKey.ERROR_TOKEN_MALFORMED),
                    SecurityConstants.Header.TOKEN, LabelKey.ERROR_TOKEN_MALFORMED);

        } catch (ExpiredJwtException ex) {
            _log.error("Access token has expired");

            throw new UnauthorizedException(Labels.getLabels(LabelKey.ERROR_TOKEN_HAS_EXPIRED),
                    SecurityConstants.Header.TOKEN, LabelKey.ERROR_TOKEN_HAS_EXPIRED);

        } catch (UnsupportedJwtException ex) {
            _log.error("Unsupported JWT token");

            throw new UnauthorizedException(Labels.getLabels(LabelKey.ERROR_JWT_TOKEN_IS_UNSUPPORTED),
                    SecurityConstants.Header.TOKEN, LabelKey.ERROR_JWT_TOKEN_IS_UNSUPPORTED);

        } catch (IllegalArgumentException ex) {
            _log.error("JWT claims string is empty.");

            throw new UnauthorizedException(Labels.getLabels(LabelKey.ERROR_INVALID_TOKEN),
                    SecurityConstants.Header.TOKEN, Labels.getLabels(LabelKey.ERROR_INVALID_TOKEN));
        } catch (Exception e) {
            _log.error("Invalid JWT signature.");

            throw new BadRequestAlertException(Labels.getLabels(LabelKey.ERROR_INVALID_TOKEN),
                    SecurityConstants.Header.TOKEN, LabelKey.ERROR_INVALID_TOKEN);
        }
    }

    private ErrorCode verifyTokenFastLogin(String refreshToken, JWTToken token, String username) {
        if (Validator.isNull(token)) {
            _log.error("Token fast login is missing. Username: {}", username);
            return ErrorCode.MSG1064;
        }

        if (Validator.isNotNull(token) && !Validator.equals(refreshToken, token.getToken())) {
            _log.error("Token fast login is invalid: {}", token);
            return ErrorCode.MSG101231;
        }

        return null;
    }

    private JWTToken createToken(String username, int duration, Map<String, Object> params) {
        Date expiration = DateUtil.getDateAfterSecond(new Date(), duration);

        String jwt = Jwts.builder()
                .setSubject(username)
                .addClaims(params)
                .signWith(key, SignatureAlgorithm.HS512)
                .setIssuedAt(new Date())
                .setExpiration(expiration).compact();

        return new JWTToken(jwt, duration);
    }

    private JWTToken createToken(String username, int duration, String tokenType) {
        Map<String, Object> params = new HashMap<>();

        params.put(SecurityConstants.Claim.TOKEN_TYPE, tokenType);

        return createToken(username, duration, params);
    }

    private JWTToken createRefreshToken(String username, Map<String, Object> params) {
        String jwt = Jwts.builder()
                .setSubject(username)
                .addClaims(params)
                .signWith(key, SignatureAlgorithm.HS512)
                .setIssuedAt(new Date()).compact();
        return new JWTToken(jwt);
    }

    private JWTToken createRefreshToken(String username, String tokenType) {
        Map<String, Object> params = new HashMap<>();

        params.put(SecurityConstants.Claim.TOKEN_TYPE, tokenType);

        return createRefreshToken(username, params);
    }

    public JWTToken createFastLoginRefreshToken(String username) {
        String currentFastLogin = StringPool.BLANK;
        JWTToken currentToken = this.tokenService.getFastLoginRefreshToken(username);

        if (Validator.isNotNull(currentToken)) {
            currentFastLogin = currentToken.getToken();
        }

        JWTToken token = createRefreshToken(username, SecurityConstants.TokenType.REFRESH_TOKEN);

        if (Validator.isNotNull(currentToken) && Validator.isNotNull(token) && Validator.equals(currentFastLogin, token.getToken())) {
            _log.info("first failed");
        }

        this.tokenService.invalidateFastLoginRefreshToken(username);
        this.tokenService.saveFastLoginRefreshToken(username, token);

        JWTToken tokenCache = this.tokenService.getFastLoginRefreshToken(username);

        if (Validator.isNull(tokenCache)) {
            _log.info("Fast login refresh token is null with username: {}", username);
        } else {
            if (Validator.isNotNull(currentFastLogin) && Validator.equals(currentFastLogin, tokenCache.getToken())) {
                _log.info("last failed");
            } else {
                _log.info("Fast login refresh token with username: {}", username);
            }
        }

        return token;
    }

    private boolean isTokenExpired(Claims claims) throws Exception {
        return claims.getExpiration().before(new Date());
    }

}
