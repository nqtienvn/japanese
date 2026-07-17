/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */

package com.mb.laos.security.util;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;

import lombok.extern.slf4j.Slf4j;

/**
 *
 * @author linhlh2
 */
@Slf4j
public class PermissionUtil {
	public static String encodePassword(String password) {

		BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder(11);

		return bCryptPasswordEncoder.encode(password);
	}

	public static boolean isMatch(String password, String encodePassword) {

		BCryptPasswordEncoder bCryptPasswordEncoder = new BCryptPasswordEncoder(11);

		return bCryptPasswordEncoder.matches(password, encodePassword);
	}

	public static void main(String[] args) {
		_log.error(PermissionUtil.encodePassword("12345678aA@"));
	}
}
