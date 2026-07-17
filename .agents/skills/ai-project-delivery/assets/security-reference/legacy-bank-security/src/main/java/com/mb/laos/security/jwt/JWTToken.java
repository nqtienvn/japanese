package com.mb.laos.security.jwt;

import java.io.Serializable;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

/**
 * 02/06/2021 - LinhLH: Create new
 *
 * @author LinhLH
 */
@Data
@AllArgsConstructor
@NoArgsConstructor
public class JWTToken implements Serializable{

	private static final long serialVersionUID = 6079085501370429127L;

	private String token;
    
    private int duration;
    
    public JWTToken(String token) {
    	this.token = token;
    }
}
