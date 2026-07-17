package com.mb.security.oauth2;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.oauth2.core.user.OAuth2User;

import java.util.Collection;
import java.util.List;
import java.util.Map;

/**
 * Custom OAuth2 User (Java 21)
 * Wraps OAuth2User with additional user information
 */
public record CustomOAuth2User(
    OAuth2User delegate,
    OAuth2UserInfo userInfo,
    Long userId
) implements OAuth2User {
    
    @Override
    public Map<String, Object> getAttributes() {
        return delegate.getAttributes();
    }
    
    @Override
    public Collection<? extends GrantedAuthority> getAuthorities() {
        return delegate.getAuthorities();
    }
    
    @Override
    public String getName() {
        return userInfo.email();
    }
    
    /**
     * Get user email
     */
    public String getEmail() {
        return userInfo.email();
    }
    
    /**
     * Get provider name
     */
    public String getProvider() {
        return userInfo.provider();
    }
}
