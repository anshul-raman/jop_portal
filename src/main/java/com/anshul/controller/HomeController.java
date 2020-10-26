package com.anshul.controller;

import com.anshul.service.PersonalProfileService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class HomeController {

	@Autowired
	PersonalProfileService personalProfileService;

	@GetMapping
	public String home() {
		return "home";
	}

	@GetMapping("/register")
	public String registration() {
		return "UserRegistration";
	}

	@PostMapping(value = "/register")
	public String registration(@RequestParam String username, @RequestParam String password,
			@RequestParam String re_password, Model model) {

		if (password.equals(re_password)) {
			try {
				personalProfileService.registerUser(username, password);
				model.addAttribute("response", "Registration Successful");

			} catch (Exception e) {
				model.addAttribute("response", "Username already exist");
			}

		} else {
			model.addAttribute("response", "Re enter Password Correctly");
		}

		return "UserRegistration";
	}

}
