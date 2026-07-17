package com.mb.security.jwt;

import java.io.Serializable;

/**
 * JWT Access Token Record (Java 21)
 * Contains both access token and CSRF token for double-token pattern
 * 
 * @param accessToken Access token (stored in cookie)
 * @param csrfToken   CSRF token (sent in header)
 */
public record JwtAccessToken(
    JwtToken accessToken,
    JwtToken csrfToken
) implements Serializable {
    
    /**
     * Compact constructor with validation
     */
    public JwtAccessToken {
        if (accessToken == null || csrfToken == null) {
            throw new IllegalArgumentException("Tokens cannot be null");
        }
    }
}
