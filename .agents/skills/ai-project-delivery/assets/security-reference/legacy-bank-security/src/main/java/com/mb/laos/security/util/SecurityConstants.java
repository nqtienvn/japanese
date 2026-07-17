package com.mb.laos.security.util;

/**
 * Constants for Spring Security authorities.
 */
public interface SecurityConstants {

    public interface SystemRole {
        public static final String USER = "ROLE_USER";

        public static final String SUPER_ADMIN = "ROLE_SUPER_ADMIN";

        public static final String ROLE_USER_POTENTIAL = "ROLE_USER_POTENTIAL";

        public static final String ROLE_USER_RESIDENT = "ROLE_USER_RESIDENT";
    }

    public interface Privilege {
        public static final String ADMINISTRATOR = "ADMINISTRATOR";

        public static final String APPROVAL = "APPROVAL";

        public static final String APPROVAL_REQUEST = "APPROVAL_REQUEST";

        public static final String CREATE = "CREATE";

        public static final String DELETE = "DELETE";

        public static final String EXPORT = "EXPORT";

        public static final String IMPORT = "IMPORT";

        public static final String READ = "READ";

        public static final String WRITE = "WRITE";
    }

    public interface Account {
        public static final String SUPER_AMDIN = "superadmin";
    }

    public interface Header {
        public static final String AUTHORIZATION_HEADER = "Authorization";

        public static final String BEARER_START = "Bearer ";

        public static final String BASIC_START = "Basic ";

        public static final String PRIVILEGES = "privileges";

        public static final String HASHKEY = "hash-key";

        public static final String LOCALE = "locale";

        public static final String REFRESH_TOKEN = "refresh-token";

        public static final String USER = "user";
        
        public static final String TOKEN = "token";
        
        public static final String DEVICE_TOKEN = "DEVICE_TOKEN";

		public static final String DEVICE_ID = "DEVICE_ID";
     
        public static final String CLIENT_MESSAGE_ID = "CLIENT_MESSAGE_ID";

        public static final String TIME_ZONE = "TIME_ZONE";

    }

    public interface Cookie {
        public static final String ACCESS_TOKEN = "mb-cms-accessToken";

        public static final String REFRESH_TOKEN = "mb-cms-refreshToken";

        public static final String REMEMBER_ME = "mb-cms-rememberMe";
    }
    
    public interface Cache {

        public static final String REFRESH_TOKEN = "refresh-token";
        
        public static final String FAST_LOGIN_REFRESH_TOKEN = "fast-login-refresh-token";

        public static final String REMEMBER_ME_TOKEN = "remember-me-token";

        public static final String TOKEN = "token";
    }
    
    public interface TokenType {
        public static final String REFRESH_TOKEN = "refresh-token";
        
        public static final String REFRESH_TOKEN_FAST_LOGIN = "refresh-token-fast-login";
        
        public static final String ACCESS_TOKEN = "access-token";
        
        public static final String CSRF_TOKEN = "csrf-token";
    }
    
    public interface Claim {
        public static final String TOKEN_TYPE = "token-type";
    }
}
