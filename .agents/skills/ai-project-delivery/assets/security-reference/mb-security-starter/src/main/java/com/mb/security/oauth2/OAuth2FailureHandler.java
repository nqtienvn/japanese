package com.mb.security.oauth2;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.SimpleUrlAuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import java.io.IOException;

/**
 * OAuth2 Failure Handler (Java 21)
 * Handles failed OAuth2 authentication
 */
@Slf4j
@Component
public class OAuth2FailureHandler extends SimpleUrlAuthenticationFailureHandler {
    
    @Override
    public void onAuthenticationFailure(
        HttpServletRequest request,
        HttpServletResponse response,
        AuthenticationException exception
    ) throws IOException {
        
        log.error("OAuth2 login failed: {}", exception.getMessage());
        
        // Redirect to login page with error
        String targetUrl = "/login?error=oauth2_failed";
        getRedirectStrategy().sendRedirect(request, response, targetUrl);
    }
}
