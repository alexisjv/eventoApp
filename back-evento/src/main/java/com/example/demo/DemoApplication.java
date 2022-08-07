package com.example.demo;

import com.example.demo.services.FileServiceImpl;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;

import java.io.File;

@SpringBootApplication
public class DemoApplication {

	public static void main(String[] args) {
		new File(FileServiceImpl.uploadDirectory).mkdir();
		SpringApplication.run(DemoApplication.class, args);
		System.out.println("Aplicación iniciada");
	}

}
