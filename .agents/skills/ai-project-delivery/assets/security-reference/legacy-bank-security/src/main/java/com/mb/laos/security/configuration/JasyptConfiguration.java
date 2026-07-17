package com.mb.laos.security.configuration;

import org.jasypt.encryption.pbe.PBEStringEncryptor;
import org.jasypt.encryption.pbe.PooledPBEStringEncryptor;
import org.jasypt.encryption.pbe.config.SimpleStringPBEConfig;
import org.jasypt.hibernate5.encryptor.HibernatePBEEncryptorRegistry;
import org.jasypt.salt.ZeroSaltGenerator;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.stereotype.Component;

import com.mb.laos.security.RsaProvider;
import com.mb.laos.util.Constants;

import lombok.Data;
import lombok.RequiredArgsConstructor;

@Data
@Component
@RequiredArgsConstructor
@ConfigurationProperties(prefix = "jasypt.encryptor")
public class JasyptConfiguration {
    private final RsaProvider rsaProvider;
    
    private String password;
    
    private String algorithm;
    
    private int poolSize;
    
    private int keyObtentionIterations;
    
    private String providerName;
    
    private String saltGeneratorClassname;
    
    private String ivGeneratorClassname;
    
    private String stringOutputType;
    
    private boolean enableDecryptTool;
    
    @Bean("jasyptStringEncryptor")
    public PBEStringEncryptor stringEncryptor() throws Exception {
        PooledPBEStringEncryptor encryptor = new PooledPBEStringEncryptor();
        
        SimpleStringPBEConfig config = new SimpleStringPBEConfig();
        
        config.setPoolSize(this.poolSize);
        config.setPassword(this.rsaProvider.decrypt(password));
        config.setAlgorithm(this.algorithm);
        config.setSaltGenerator(new ZeroSaltGenerator());
        config.setStringOutputType(this.stringOutputType);
        config.setKeyObtentionIterations(this.keyObtentionIterations);
        
        encryptor.setConfig(config);
        
        return encryptor;
    }
    
    @Bean("hibernatePBEEncryptorRegistry")
    public HibernatePBEEncryptorRegistry registry() throws Exception {
        HibernatePBEEncryptorRegistry registry = HibernatePBEEncryptorRegistry.getInstance();

        registry.registerPBEStringEncryptor(Constants.HibernateDefName.STRING_ENCRYPTOR, stringEncryptor());

        return registry;
    }
}
