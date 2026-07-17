/**
 *
 */
package com.mb.laos.service;

import org.springframework.cache.annotation.CacheEvict;
import org.springframework.cache.annotation.CachePut;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.cache.annotation.Caching;
import com.mb.laos.security.jwt.JWTAccessToken;
import com.mb.laos.security.jwt.JWTToken;
import com.mb.laos.security.util.SecurityConstants;

/**
 * @author LinhLH
 */
public interface TokenService {

    @Cacheable(cacheNames = SecurityConstants.Cache.REFRESH_TOKEN, key = "#username", unless = "#result == null")
    default JWTToken getRefreshToken(String username) {
        return null;
    }

    /**
     * @param username
     * @return
     */
    @Cacheable(cacheNames = SecurityConstants.Cache.REMEMBER_ME_TOKEN, key = "#username", unless = "#result == null")
    default JWTAccessToken getRememberMeToken(String username) {
        return null;
    }

    /**
     * @param username
     * @return
     */
    @Cacheable(cacheNames = SecurityConstants.Cache.TOKEN, key = "#username", unless = "#result == null")
    default JWTAccessToken getToken(String username) {
        return null;
    }

    /**
     * @param username
     */
    @Caching(evict = {@CacheEvict(value = SecurityConstants.Cache.REMEMBER_ME_TOKEN, key = "#username"),
            @CacheEvict(value = SecurityConstants.Cache.TOKEN, key = "#username"),
            @CacheEvict(value = SecurityConstants.Cache.REFRESH_TOKEN, key = "#username"),
            @CacheEvict(value = SecurityConstants.Cache.FAST_LOGIN_REFRESH_TOKEN, key = "#username")})
    default String invalidateToken(String username) {
        return username;
    }

    /**
     * @param username
     */
    @Caching(evict = {@CacheEvict(value = SecurityConstants.Cache.REMEMBER_ME_TOKEN, key = "#username"),
            @CacheEvict(value = SecurityConstants.Cache.TOKEN, key = "#username")})
    default String invalidateCsrfToken(String username) {
        return username;
    }

    /**
     * @param username
     * @param token
     */
    @CachePut(cacheNames = SecurityConstants.Cache.REFRESH_TOKEN, key = "#username", unless = "#result == null")
    default JWTToken saveRefreshToken(String username, JWTToken token) {
        return token;
    }

    /**
     * @param username
     * @param token
     */

    @Caching(
            put = {@CachePut(cacheNames = SecurityConstants.Cache.REMEMBER_ME_TOKEN, key = "#username",
                    unless = "#result == null")},
            evict = {@CacheEvict(value = SecurityConstants.Cache.TOKEN, key = "#username")})
    default JWTAccessToken saveRememberMeToken(String username, JWTAccessToken token) {
        return token;
    }

    /**
     * @param username
     * @param token
     */
    @Caching(
            put = {@CachePut(cacheNames = SecurityConstants.Cache.TOKEN, key = "#username",
                    unless = "#result == null")},
            evict = {@CacheEvict(value = SecurityConstants.Cache.REMEMBER_ME_TOKEN, key = "#username")})
    default JWTAccessToken saveToken(String username, JWTAccessToken token) {
        return token;
    }

    /**
     * @param username
     * @param jwtToken
     * @return
     */
    @Caching(put = {
            @CachePut(cacheNames = SecurityConstants.Cache.FAST_LOGIN_REFRESH_TOKEN, key = "#username",
                    unless = "#result == null")
    }, evict = {
            @CacheEvict(cacheNames = SecurityConstants.Cache.REFRESH_TOKEN, key = "#username")
    })
    default JWTToken saveFastLoginRefreshToken(String username, JWTToken jwtToken) {
        return jwtToken;
    }

    /**
     * @param username
     * @return
     */
    @Cacheable(cacheNames = SecurityConstants.Cache.FAST_LOGIN_REFRESH_TOKEN, key = "#username")
    default JWTToken getFastLoginRefreshToken(String username) {
        return null;
    }

    /**
     * @param username
     */
    @Caching(evict = @CacheEvict(value = SecurityConstants.Cache.FAST_LOGIN_REFRESH_TOKEN, key = "#username"))
    default String invalidateFastLoginRefreshToken(String username) {
        return username;
    }
}
