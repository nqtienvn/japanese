package com.mb.security.util;

/**
 * Security Constants (Java 21 with enhanced switch)
 */
public final class SecurityConstants {
    
    private SecurityConstants() {
        throw new AssertionError("Cannot instantiate constants class");
    }
    
    public sealed interface SystemRole permits SystemRole.User, SystemRole.Admin, SystemRole.SuperAdmin {
        String value();
        
        record User() implements SystemRole {
            @Override
            public String value() { return "ROLE_USER"; }
        }
        
        record Admin() implements SystemRole {
            @Override
            public String value() { return "ROLE_ADMIN"; }
        }
        
        record SuperAdmin() implements SystemRole {
            @Override
            public String value() { return "ROLE_SUPER_ADMIN"; }
        }
    }
    
    public enum Privilege {
        CREATE, READ, WRITE, DELETE, EXPORT, IMPORT, APPROVAL;
        
        public String value() {
            return this.name();
        }
    }
    
    public static final class Header {
        public static final String AUTHORIZATION = "Authorization";
        public static final String BEARER_PREFIX = "Bearer ";
        public static final String REFRESH_TOKEN = "X-Refresh-Token";
        public static final String DEVICE_ID = "X-Device-ID";
        
        private Header() {}
    }
    
    public static final class Cookie {
        public static final String ACCESS_TOKEN = "mb-accessToken";
        public static final String REFRESH_TOKEN = "mb-refreshToken";
        public static final String REMEMBER_ME = "mb-rememberMe";
        
        private Cookie() {}
    }
    
    public static final class Cache {
        public static final String TOKEN_PREFIX = "token:";
        public static final String REFRESH_TOKEN_PREFIX = "refresh-token:";
        public static final String BLACKLIST_PREFIX = "blacklist:";
        public static final String RATE_LIMIT_PREFIX = "rate-limit:";
        
        private Cache() {}
    }
    
    public enum TokenType {
        ACCESS_TOKEN("access-token"),
        REFRESH_TOKEN("refresh-token"),
        CSRF_TOKEN("csrf-token");
        
        private final String value;
        
        TokenType(String value) {
            this.value = value;
        }
        
        public String value() {
            return value;
        }
    }
    
    public static final class Claim {
        public static final String TOKEN_TYPE = "token-type";
        public static final String AUTHORITIES = "authorities";
        public static final String USER_ID = "user-id";
        
        private Claim() {}
    }
}
