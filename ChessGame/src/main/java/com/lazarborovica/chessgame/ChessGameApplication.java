package com.lazarborovica.chessgame;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

@SpringBootApplication
//@EnableJpaRepositories("com.lazarborovica.chessgame")
//@ComponentScan(basePackages = { "com.lazarborovica.chessgame" })
@EntityScan("com.lazarborovica.chessgame.entity")
public class ChessGameApplication {

	public static void main(String[] args) {
		SpringApplication.run(ChessGameApplication.class, args);
	}

}
