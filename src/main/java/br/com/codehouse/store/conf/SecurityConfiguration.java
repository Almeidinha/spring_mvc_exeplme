package br.com.codehouse.store.conf;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.builders.WebSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.util.matcher.AntPathRequestMatcher;

import br.com.codehouse.store.daos.UserDao;


@EnableWebSecurity
public class SecurityConfiguration extends WebSecurityConfigurerAdapter {
	
	@Autowired
	private UserDao userDao;

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
		//.antMatchers("/resources/**").permitAll()
		//.antMatchers("/sumary-files/**").permitAll()
		.antMatchers("/shopCart/**").permitAll()
		.antMatchers("/shopCart").permitAll()
		.antMatchers("/payment").permitAll()
		.antMatchers("/payment/**").permitAll()
		.antMatchers("/products/form").hasRole("ADMIN")		
		.antMatchers(HttpMethod.POST, "/products").hasRole("ADMIN")
		.antMatchers(HttpMethod.GET, "/products").hasRole("ADMIN")
		.antMatchers("/products/**").permitAll()
		.antMatchers("/").permitAll()
		.anyRequest().authenticated()
		.and().formLogin().loginPage("/login").permitAll()
		.and().logout().logoutRequestMatcher(new AntPathRequestMatcher("/logout")); 
	}
	
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDao)
		.passwordEncoder(new BCryptPasswordEncoder());
	}
	
    // Recommended method to ignore static resources in the security filter.
    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring()
        .antMatchers("/resources/**")
        .antMatchers("/sumary-files/**");
    }
	
}
