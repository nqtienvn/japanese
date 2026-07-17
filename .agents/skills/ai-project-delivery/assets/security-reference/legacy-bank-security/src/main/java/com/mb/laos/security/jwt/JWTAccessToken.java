package com.mb.laos.security.jwt;

import java.io.Serializable;
import lombok.Builder;
import lombok.Data;

/**
 * 02/06/2021 - LinhLH: Create new
 *
 * @author LinhLH
 */
@Data
@Builder
public class JWTAccessToken implements Serializable{

	private static final long serialVersionUID = 2271652818578387603L;

	private JWTToken accessToken;
    
    private JWTToken csrfToken;
}
