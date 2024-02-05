package com.lazarborovica.chessgame.security;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
@EnableWebSecurity
public class SecurityConfig extends WebSecurityConfigurerAdapter {
    @Override
    protected void configure(HttpSecurity http) throws Exception {
        http.authorizeRequests()
                .antMatchers("/auth/**").permitAll()
                .antMatchers("/admin/**").hasRole("ADMIN")
                .antMatchers("/user/**").authenticated()
                .antMatchers("/game/**").authenticated()
                .antMatchers("/stats/**").authenticated()
                .antMatchers("/friends/**").authenticated()
                .and()
                .formLogin()
                .loginPage("/auth/loginPage")
                .loginProcessingUrl("/login")
                .defaultSuccessUrl("/main.jsp")
                .and().csrf().disable();
    }
}



