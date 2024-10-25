package vn.com.jobviet;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
// @SpringBootApplication(exclude = 
// org.springframework.boot.autoconfigure.security.servlet.SecurityAutoConfiguration.class) 
public class JobvietApplication {

	public static void main(String[] args) {
		SpringApplication.run(JobvietApplication.class, args);
	}

}
