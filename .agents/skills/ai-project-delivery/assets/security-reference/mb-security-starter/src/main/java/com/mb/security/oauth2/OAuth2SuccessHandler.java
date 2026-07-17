package com.mb.security.oauth2;

import com.mb.security.jwt.JwtTokenProvider;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;

/**
 * OAuth2 Success Handler (Java 21)
 * Handles successful OAuth2 authentication and generates JWT tokens
 */
@Slf4j
@Component
public class OAuth2SuccessHandler extends SimpleUrlAuthenticationSuccessHandler {
    
    private final JwtTokenProvider jwtTokenProvider;
    
    public OAuth2SuccessHandler(JwtTokenProvider jwtTokenProvider) {
        this.jwtTokenProvider = jwtTokenProvider;
    }
    
    @Override
    public void onAuthenticationSuccess(
        HttpServletRequest request,
        HttpServletResponse response,
        Authentication authentication
    ) throws IOException {
        
        var oauth2User = (CustomOAuth2User) authentication.getPrincipal();
        
        log.info("OAuth2 login successful: provider={}, email={}", 
            oauth2User.getProvider(), oauth2User.getEmail());
        
        // Generate JWT tokens for OAuth2 user
        var tokens = jwtTokenProvider.createAccessToken(oauth2User.getEmail());
        
        // Set access token cookie
        var accessCookie = new Cookie("mb-accessToken", tokens.accessToken().token());
        accessCookie.setHttpOnly(true);
        accessCookie.setSecure(true);
        accessCookie.setPath("/");
        accessCookie.setMaxAge(tokens.accessToken().duration());
        response.addCookie(accessCookie);
        
        // Set refresh token cookie
        var refreshToken = jwtTokenProvider.createRefreshToken(oauth2User.getEmail());
        var refreshCookie = new Cookie("mb-refreshToken", refreshToken.token());
        refreshCookie.setHttpOnly(true);
        refreshCookie.setSecure(true);
        refreshCookie.setPath("/");
        refreshCookie.setMaxAge(refreshToken.duration());
        response.addCookie(refreshCookie);
        
        // Redirect to success URL
        String targetUrl = determineTargetUrl(request, response, authentication);
        getRedirectStrategy().sendRedirect(request, response, targetUrl);
    }
    
    @Override
    protected String determineTargetUrl(
        HttpServletRequest request,
        HttpServletResponse response,
        Authentication authentication
    ) {
        // You can customize this based on your needs
        return "/";
    }
}
