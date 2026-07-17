package com.mb.security.oauth2;

import lombok.extern.slf4j.Slf4j;
import org.springframework.security.oauth2.client.userinfo.DefaultOAuth2UserService;
import org.springframework.security.oauth2.client.userinfo.OAuth2UserRequest;
import org.springframework.security.oauth2.core.OAuth2AuthenticationException;
import org.springframework.security.oauth2.core.user.OAuth2User;
import org.springframework.stereotype.Service;

/**
 * Custom OAuth2 User Service (Java 21)
 * Handles user information from Google and Facebook
 */
@Slf4j
@Service
public class CustomOAuth2UserService extends DefaultOAuth2UserService {
    
    @Override
    public OAuth2User loadUser(OAuth2UserRequest userRequest) throws OAuth2AuthenticationException {
        OAuth2User oauth2User = super.loadUser(userRequest);
        
        String registrationId = userRequest.getClientRegistration().getRegistrationId();
        var attributes = oauth2User.getAttributes();
        
        // Extract user info based on provider using switch expression
        OAuth2UserInfo userInfo = switch (registrationId.toLowerCase()) {
            case "google" -> OAuth2UserInfo.fromGoogle(attributes);
            case "facebook" -> OAuth2UserInfo.fromFacebook(attributes);
            default -> throw new OAuth2AuthenticationException(
                "Unsupported OAuth2 provider: " + registrationId
            );
        };
        
        log.info("OAuth2 user loaded: provider={}, email={}", 
            userInfo.provider(), userInfo.email());
        
        // Here you would typically:
        // 1. Find or create user in database
        // 2. Link OAuth2 account to existing user
        // For now, we just wrap the OAuth2User
        
        return new CustomOAuth2User(oauth2User, userInfo, null);
    }
}
