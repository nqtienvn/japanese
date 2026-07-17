package com.mb.security.config;

import org.springframework.boot.context.properties.ConfigurationProperties;

import java.util.List;
import java.util.Map;

/**
 * Security Configuration Properties (Java 21 Record)
 * All security settings in one place
 */
@ConfigurationProperties(prefix = "mb.security")
public record SecurityProperties(
    Jwt jwt,
    Password password,
    Rsa rsa,
    Cors cors,
    Cookie cookie,
    OAuth2 oauth2
) {
    
    /**
     * Default constructor with default values
     */
    public SecurityProperties {
        jwt = jwt != null ? jwt : new Jwt(null, 3600, 604800, "mb-security", List.of());
        password = password != null ? password : new Password(12, 5, 900);
        rsa = rsa != null ? rsa : new Rsa(2048, "RSA/ECB/PKCS1Padding", null, null);
        cors = cors != null ? cors : new Cors("*", "GET,POST,PUT,DELETE,OPTIONS", "*", "Authorization", true, 3600L);
        cookie = cookie != null ? cookie : new Cookie(null, true, "/", true, "Lax");
        oauth2 = oauth2 != null ? oauth2 : new OAuth2(false, "/", "/login?error", Map.of());
    }
    
    public record Jwt(
        String secret,
        int accessTokenExpiration,
        int refreshTokenExpiration,
        String issuer,
        List<String> specialClients
    ) {
        public Jwt {
            accessTokenExpiration = accessTokenExpiration > 0 ? accessTokenExpiration : 3600;
            refreshTokenExpiration = refreshTokenExpiration > 0 ? refreshTokenExpiration : 604800;
            issuer = issuer != null && !issuer.isBlank() ? issuer : "mb-security";
            specialClients = specialClients != null ? specialClients : List.of();
        }
    }
    
    public record Password(
        int bcryptStrength,
        int maxAttempts,
        int lockDuration
    ) {
        public Password {
            if (bcryptStrength < 4 || bcryptStrength > 31) {
                throw new IllegalArgumentException("BCrypt strength must be between 4 and 31");
            }
        }
    }
    
    public record Rsa(
        int keyLength,
        String algorithm,
        String privateKey,
        String publicKey
    ) {}
    
    public record Cors(
        String allowedOrigins,
        String allowedMethods,
        String allowedHeaders,
        String exposedHeaders,
        boolean allowCredentials,
        long maxAge
    ) {}
    
    public record Cookie(
        String domain,
        boolean secure,
        String path,
        boolean httpOnly,
        String sameSite
    ) {}
    
    public record OAuth2(
        boolean enabled,
        String successRedirectUrl,
        String failureRedirectUrl,
        Map<String, Provider> providers
    ) {
        public record Provider(
            String clientId,
            String clientSecret,
            String redirectUri,
            List<String> scope
        ) {}
    }
}
