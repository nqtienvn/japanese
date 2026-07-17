package com.mb.security.oauth2;

import java.io.Serializable;
import java.util.Map;

/**
 * OAuth2 User Info Record (Java 21)
 * Represents user information from OAuth2 providers
 * 
 * @param provider   OAuth2 provider (google, facebook)
 * @param providerId User ID from provider
 * @param email      User email
 * @param name       User full name
 * @param picture    Profile picture URL
 * @param attributes All attributes from provider
 */
public record OAuth2UserInfo(
    String provider,
    String providerId,
    String email,
    String name,
    String picture,
    Map<String, Object> attributes
) implements Serializable {
    
    /**
     * Compact constructor with validation
     */
    public OAuth2UserInfo {
        if (provider == null || providerId == null) {
            throw new IllegalArgumentException("Provider and providerId are required");
        }
    }
    
    /**
     * Factory method for Google OAuth2
     */
    public static OAuth2UserInfo fromGoogle(Map<String, Object> attributes) {
        return new OAuth2UserInfo(
            "google",
            (String) attributes.get("sub"),
            (String) attributes.get("email"),
            (String) attributes.get("name"),
            (String) attributes.get("picture"),
            attributes
        );
    }
    
    /**
     * Factory method for Facebook OAuth2
     */
    public static OAuth2UserInfo fromFacebook(Map<String, Object> attributes) {
        String pictureUrl = null;
        if (attributes.get("picture") instanceof Map<?, ?> pictureData) {
            if (pictureData.get("data") instanceof Map<?, ?> data) {
                pictureUrl = (String) data.get("url");
            }
        }
        
        return new OAuth2UserInfo(
            "facebook",
            (String) attributes.get("id"),
            (String) attributes.get("email"),
            (String) attributes.get("name"),
            pictureUrl,
            attributes
        );
    }
}
