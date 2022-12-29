package com.kh_semi.servlet_with_db;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.ServletComponentScan;

import jakarta.servlet.annotation.WebServlet;

@ServletComponentScan
@SpringBootApplication
public class ServletWithDbApplication {

	public static void main(String[] args) {
		SpringApplication.run(ServletWithDbApplication.class, args);
	}

}
