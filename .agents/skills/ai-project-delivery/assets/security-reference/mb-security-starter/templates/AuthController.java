package com.example.controller;

import com.example.dto.*;
import com.example.entity.User;
import com.example.repository.UserRepository;
import com.mb.security.jwt.JwtTokenProvider;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.web.bind.annotation.*;

import java.util.Set;

/**
 * AuthController Template
 * Copy this to your project and adjust package name
 */
@RestController
@RequestMapping("/api/auth")
@RequiredArgsConstructor
public class AuthController {
    
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final JwtTokenProvider jwtTokenProvider;
    
    @PostMapping("/register")
    public ResponseEntity<?> register(@RequestBody RegisterRequest request) {
        // Validate
        if (userRepository.existsByUsername(request.getUsername())) {
            return ResponseEntity.badRequest().body("Username already exists");
        }
        
        if (userRepository.existsByEmail(request.getEmail())) {
            return ResponseEntity.badRequest().body("Email already exists");
        }
        
        // Create user
        var user = new User();
        user.setUsername(request.getUsername());
        user.setPassword(passwordEncoder.encode(request.getPassword()));
        user.setEmail(request.getEmail());
        user.setFullName(request.getFullName());
        user.setRoles(Set.of("ROLE_USER"));
        user.setEnabled(true);
        
        userRepository.save(user);
        
        return ResponseEntity.ok(new MessageResponse("User registered successfully"));
    }
    
    @PostMapping("/login")
    public ResponseEntity<LoginResponse> login(@RequestBody LoginRequest request) {
        // Find user
        var user = userRepository.findByUsername(request.getUsername())
            .orElseThrow(() -> new BadCredentialsException("Invalid username or password"));
        
        // Validate password
        if (!passwordEncoder.matches(request.getPassword(), user.getPassword())) {
            throw new BadCredentialsException("Invalid username or password");
        }
        
        // Check if enabled
        if (!user.isEnabled()) {
            throw new BadCredentialsException("Account is disabled");
        }
        
        // Generate JWT tokens
        var tokens = jwtTokenProvider.createAccessToken(
            user.getUsername(),
            request.isRememberMe()
        );
        
        return ResponseEntity.ok(new LoginResponse(
            tokens.accessToken().token(),
            tokens.csrfToken().token(),
            user.getUsername(),
            user.getEmail(),
            user.getRoles()
        ));
    }
    
    @PostMapping("/refresh")
    public ResponseEntity<TokenResponse> refresh(@RequestBody RefreshTokenRequest request) {
        // Validate refresh token
        if (!jwtTokenProvider.validateRefreshToken(request.getRefreshToken())) {
            throw new BadCredentialsException("Invalid refresh token");
        }
        
        // Get username from token
        String username = jwtTokenProvider.getUsernameFromToken(request.getRefreshToken());
        
        // Generate new tokens
        var tokens = jwtTokenProvider.createAccessToken(username);
        
        return ResponseEntity.ok(new TokenResponse(
            tokens.accessToken().token(),
            tokens.csrfToken().token()
        ));
    }
}
