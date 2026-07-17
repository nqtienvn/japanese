package com.mb.security.jwt;

import java.io.Serializable;

/**
 * JWT Token Record (Java 21)
 * Immutable token representation
 * 
 * @param token    The JWT token string
 * @param duration Token duration in seconds
 */
public record JwtToken(
    String token,
    int duration
) implements Serializable {
    
    /**
     * Constructor for token without duration
     */
    public JwtToken(String token) {
        this(token, 0);
    }
    
    /**
     * Check if token has expiration
     */
    public boolean hasExpiration() {
        return duration > 0;
    }
}
