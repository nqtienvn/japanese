package com.mb.security.util;

import org.springframework.security.authentication.AnonymousAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.Collection;
import java.util.List;
import java.util.Optional;

/**
 * Security Utility Methods (Java 21)
 * Uses pattern matching and modern Java features
 */
public final class SecurityUtils {
    
    private SecurityUtils() {
        throw new AssertionError("Cannot instantiate utility class");
    }
    
    /**
     * Convert list of authority strings to GrantedAuthority list
     */
    public static List<GrantedAuthority> getAuthorities(List<String> authorities) {
        return authorities.stream()
            .map(SimpleGrantedAuthority::new)
            .toList();  // Java 16+ toList()
    }
    
    /**
     * Get the JWT token of the current user
     */
    public static Optional<String> getCurrentUserJWT() {
        return getCurrentAuthentication()
            .filter(auth -> auth.getCredentials() instanceof String)
            .map(auth -> (String) auth.getCredentials());
    }
    
    /**
     * Get the login/username of the current user
     * Uses Java 21 pattern matching
     */
    public static Optional<String> getCurrentUserLogin() {
        return getCurrentAuthentication()
            .map(authentication -> switch (authentication) {
                case AnonymousAuthenticationToken _ -> null;
                case Authentication auth when auth.getPrincipal() instanceof UserDetails user ->
                    user.getUsername();
                case Authentication auth when auth.getPrincipal() instanceof String username ->
                    username;
                default -> null;
            });
    }
    
    /**
     * Get current authentication object
     */
    public static Optional<Authentication> getCurrentAuthentication() {
        var securityContext = SecurityContextHolder.getContext();
        return Optional.ofNullable(securityContext.getAuthentication());
    }
    
    /**
     * Convert GrantedAuthority collection to string list
     */
    public static List<String> getAuthorityNames(Collection<? extends GrantedAuthority> authorities) {
        return authorities.stream()
            .map(GrantedAuthority::getAuthority)
            .toList();
    }
    
    /**
     * Check if a user is authenticated
     */
    public static boolean isAuthenticated() {
        return getCurrentAuthentication()
            .map(auth -> !(auth instanceof AnonymousAuthenticationToken) && auth.isAuthenticated())
            .orElse(false);
    }
    
    /**
     * Check if current user has a specific role
     */
    public static boolean hasRole(String role) {
        return getCurrentAuthentication()
            .map(auth -> auth.getAuthorities().stream()
                .anyMatch(authority -> authority.getAuthority().equals(role)))
            .orElse(false);
    }
    
    /**
     * Check if current user has any of the specified roles
     * Uses Java 21 pattern matching in stream
     */
    public static boolean hasAnyRole(String... roles) {
        return getCurrentAuthentication()
            .map(auth -> {
                var authorities = auth.getAuthorities();
                return List.of(roles).stream()
                    .anyMatch(role -> authorities.stream()
                        .anyMatch(authority -> authority.getAuthority().equals(role)));
            })
            .orElse(false);
    }
}
