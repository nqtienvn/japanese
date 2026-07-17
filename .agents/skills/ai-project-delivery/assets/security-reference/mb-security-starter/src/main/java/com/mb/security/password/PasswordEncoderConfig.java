package com.mb.security.password;

import com.mb.security.config.SecurityProperties;
import org.springframework.boot.autoconfigure.condition.ConditionalOnMissingBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;

/**
 * Password Encoder Configuration (Java 21)
 */
@Configuration
public class PasswordEncoderConfig {
    
    @Bean
    @ConditionalOnMissingBean
    public PasswordEncoder passwordEncoder(SecurityProperties properties) {
        int strength = properties.password().bcryptStrength();
        return new BCryptPasswordEncoder(strength);
    }
}
