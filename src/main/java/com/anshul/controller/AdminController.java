package com.anshul.controller;

import com.anshul.service.CompanyService;

import java.util.List;

import com.anshul.model.Company;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	CompanyService comapanyService;


	@GetMapping
	@PreAuthorize("hasAuthority('ADMIN')")
	public String admin_home() {
		return "admin_home";
	}


	@GetMapping("company")
	@PreAuthorize("hasAuthority('ADMIN')")
	public String companyList(Model model){
		
		List<Company> companies = comapanyService.getAll();
		model.addAttribute("companies", companies);
		
		return "admin_companyList";
	}

	@GetMapping("company/{id}")
	@PreAuthorize("hasAuthority('ADMIN')")
	public String companyDetails(@PathVariable int id, Model model){

		Company company = comapanyService.getDetails(id);
		model.addAttribute("company", company);
		return "admin_companyDetails";
	}
	
}
