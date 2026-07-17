/**
 * 
 */
package com.mb.laos.security.configuration;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.access.expression.method.MethodSecurityExpressionHandler;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.security.config.annotation.method.configuration.GlobalMethodSecurityConfiguration;

import com.mb.laos.security.PermissionEvaluatorImpl;
import com.mb.laos.security.handler.MethodSecurityExpressionHandlerImpl;

/**
 * @author LinhLH - ok
 *
 */
@Configuration
@EnableGlobalMethodSecurity(prePostEnabled = true, securedEnabled = true)
public class MethodSecurityConfiguration extends GlobalMethodSecurityConfiguration {
	@Override
	protected MethodSecurityExpressionHandler createExpressionHandler() {

		return new MethodSecurityExpressionHandlerImpl(new PermissionEvaluatorImpl());

	}
}
