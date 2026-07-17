package com.mb.security.autoconfigure;

import com.mb.security.config.SecurityProperties;
import com.mb.security.jwt.JwtAuthenticationFilter;
import com.mb.security.jwt.JwtTokenProvider;
import com.mb.security.oauth2.CustomOAuth2UserService;
import com.mb.security.oauth2.OAuth2FailureHandler;
import com.mb.security.oauth2.OAuth2SuccessHandler;
import com.mb.security.password.PasswordEncoderConfig;
import lombok.RequiredArgsConstructor;
import org.springframework.boot.autoconfigure.AutoConfiguration;
import org.springframework.boot.autoconfigure.condition.ConditionalOnClass;
import org.springframework.boot.autoconfigure.condition.ConditionalOnProperty;
import org.springframework.boot.autoconfigure.condition.ConditionalOnWebApplication;
import org.springframework.boot.context.properties.EnableConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Import;
import org.springframework.security.config.annotation.method.configuration.EnableMethodSecurity;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configurers.AbstractHttpConfigurer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.oauth2.client.registration.ClientRegistration;
import org.springframework.security.oauth2.client.registration.ClientRegistrationRepository;
import org.springframework.security.oauth2.client.registration.InMemoryClientRegistrationRepository;
import org.springframework.security.oauth2.core.AuthorizationGrantType;
import org.springframework.security.oauth2.core.ClientAuthenticationMethod;
import org.springframework.security.oauth2.core.oidc.IdTokenClaimNames;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsConfigurationSource;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

/**
 * MB Security Auto Configuration (Java 21 + Spring Security 6)
 * Modern security configuration with OAuth2 support
 */
@AutoConfiguration
@ConditionalOnClass(name = "org.springframework.security.config.annotation.web.configuration.EnableWebSecurity")
@ConditionalOnWebApplication
@EnableConfigurationProperties(SecurityProperties.class)
@EnableWebSecurity
@EnableMethodSecurity(prePostEnabled = true, securedEnabled = true)
@Import(PasswordEncoderConfig.class)
@RequiredArgsConstructor
public class MbSecurityAutoConfiguration {
    
    private final SecurityProperties properties;
    private final JwtTokenProvider jwtTokenProvider;
    
    /**
     * Main Security Filter Chain (Spring Security 6 API)
     */
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http) throws Exception {
        http
            // CORS
            .cors(cors -> cors.configurationSource(corsConfigurationSource()))
            
            // CSRF - Disabled for JWT
            .csrf(AbstractHttpConfigurer::disable)
            
            // Session - Stateless
            .sessionManagement(session -> 
                session.sessionCreationPolicy(SessionCreationPolicy.STATELESS)
            )
            
            // Authorization
            .authorizeHttpRequests(auth -> auth
                // Public endpoints
                .requestMatchers("/api/auth/**").permitAll()
                .requestMatchers("/api/public/**").permitAll()
                .requestMatchers("/actuator/health").permitAll()
                .requestMatchers("/oauth2/**").permitAll()
                .requestMatchers("/login/oauth2/**").permitAll()
                
                // All other requests need authentication
                .anyRequest().authenticated()
            )
            
            // JWT Filter
            .addFilterBefore(
                jwtAuthenticationFilter(), 
                UsernamePasswordAuthenticationFilter.class
            );
        
        // OAuth2 Login (if enabled)
        if (properties.oauth2().enabled()) {
            http.oauth2Login(oauth2 -> oauth2
                .userInfoEndpoint(userInfo -> 
                    userInfo.userService(customOAuth2UserService())
                )
                .successHandler(oauth2SuccessHandler())
                .failureHandler(oauth2FailureHandler())
            );
        }
        
        return http.build();
    }
    
    /**
     * JWT Authentication Filter
     */
    @Bean
    public JwtAuthenticationFilter jwtAuthenticationFilter() {
        return new JwtAuthenticationFilter(jwtTokenProvider);
    }
    
    /**
     * CORS Configuration Source
     */
    @Bean
    public CorsConfigurationSource corsConfigurationSource() {
        var configuration = new CorsConfiguration();
        var corsConfig = properties.cors();
        
        // Allowed origins
        if ("*".equals(corsConfig.allowedOrigins())) {
            configuration.addAllowedOriginPattern("*");
        } else {
            configuration.setAllowedOrigins(
                Arrays.asList(corsConfig.allowedOrigins().split(","))
            );
        }
        
        // Allowed methods
        configuration.setAllowedMethods(
            Arrays.asList(corsConfig.allowedMethods().split(","))
        );
        
        // Allowed headers
        if ("*".equals(corsConfig.allowedHeaders())) {
            configuration.addAllowedHeader("*");
        } else {
            configuration.setAllowedHeaders(
                Arrays.asList(corsConfig.allowedHeaders().split(","))
            );
        }
        
        // Exposed headers
        configuration.setExposedHeaders(
            Arrays.asList(corsConfig.exposedHeaders().split(","))
        );
        
        configuration.setAllowCredentials(corsConfig.allowCredentials());
        configuration.setMaxAge(corsConfig.maxAge());
        
        var source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", configuration);
        
        return source;
    }
    
    /**
     * OAuth2 Client Registration Repository
     */
    @Bean
    @ConditionalOnProperty(prefix = "mb.security.oauth2", name = "enabled", havingValue = "true")
    public ClientRegistrationRepository clientRegistrationRepository() {
        List<ClientRegistration> registrations = new ArrayList<>();
        
        var providers = properties.oauth2().providers();
        
        // Google
        if (providers.containsKey("google")) {
            registrations.add(googleClientRegistration(providers.get("google")));
        }
        
        // Facebook
        if (providers.containsKey("facebook")) {
            registrations.add(facebookClientRegistration(providers.get("facebook")));
        }
        
        return new InMemoryClientRegistrationRepository(registrations);
    }
    
    /**
     * Custom OAuth2 User Service
     */
    @Bean
    public CustomOAuth2UserService customOAuth2UserService() {
        return new CustomOAuth2UserService();
    }
    
    /**
     * OAuth2 Success Handler
     */
    @Bean
    public OAuth2SuccessHandler oauth2SuccessHandler() {
        return new OAuth2SuccessHandler(jwtTokenProvider);
    }
    
    /**
     * OAuth2 Failure Handler
     */
    @Bean
    public OAuth2FailureHandler oauth2FailureHandler() {
        return new OAuth2FailureHandler();
    }
    
    // ========== Private Helper Methods ==========
    
    private ClientRegistration googleClientRegistration(SecurityProperties.OAuth2.Provider google) {
        return ClientRegistration.withRegistrationId("google")
            .clientId(google.clientId())
            .clientSecret(google.clientSecret())
            .clientAuthenticationMethod(ClientAuthenticationMethod.CLIENT_SECRET_BASIC)
            .authorizationGrantType(AuthorizationGrantType.AUTHORIZATION_CODE)
            .redirectUri(google.redirectUri())
            .scope(google.scope())
            .authorizationUri("https://accounts.google.com/o/oauth2/v2/auth")
            .tokenUri("https://www.googleapis.com/oauth2/v4/token")
            .userInfoUri("https://www.googleapis.com/oauth2/v3/userinfo")
            .userNameAttributeName(IdTokenClaimNames.SUB)
            .jwkSetUri("https://www.googleapis.com/oauth2/v3/certs")
            .clientName("Google")
            .build();
    }
    
    private ClientRegistration facebookClientRegistration(SecurityProperties.OAuth2.Provider facebook) {
        return ClientRegistration.withRegistrationId("facebook")
            .clientId(facebook.clientId())
            .clientSecret(facebook.clientSecret())
            .clientAuthenticationMethod(ClientAuthenticationMethod.CLIENT_SECRET_POST)
            .authorizationGrantType(AuthorizationGrantType.AUTHORIZATION_CODE)
            .redirectUri(facebook.redirectUri())
            .scope(facebook.scope())
            .authorizationUri("https://www.facebook.com/v18.0/dialog/oauth")
            .tokenUri("https://graph.facebook.com/v18.0/oauth/access_token")
            .userInfoUri("https://graph.facebook.com/me?fields=id,name,email,picture")
            .userNameAttributeName("id")
            .clientName("Facebook")
            .build();
    }
}
