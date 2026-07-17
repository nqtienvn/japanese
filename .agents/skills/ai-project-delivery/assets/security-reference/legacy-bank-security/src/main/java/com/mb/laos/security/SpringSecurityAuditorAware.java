package com.mb.laos.security;

import java.util.Optional;
import org.springframework.data.domain.AuditorAware;
import org.springframework.stereotype.Component;
import com.mb.laos.security.util.SecurityConstants;
import com.mb.laos.security.util.SecurityUtils;

/**
 * Implementation of {@link AuditorAware} based on Spring Security.
 */
@Component
public class SpringSecurityAuditorAware implements AuditorAware<String> {

	@Override
	public Optional<String> getCurrentAuditor() {
		return Optional.of(SecurityUtils.getCurrentUserLogin().orElse(SecurityConstants.Account.SUPER_AMDIN));
	}
}
