package com.anshul.repository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Repository;

@Repository
public class RegistrationRepository {

	@Autowired
	BCryptPasswordEncoder encoder;
	
	@Autowired
	JdbcTemplate jdbctemplate;
	
	public void registerUser(String username, String pass) {
		pass = encoder.encode(pass);
		String query = "insert into users (username, password) values (?, ?)";
		jdbctemplate.update(query, username, pass);
		
	}

	
	
}
