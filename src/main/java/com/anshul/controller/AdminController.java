package com.anshul.controller;

import com.anshul.service.CompanyService;
import com.anshul.service.CriteriaService;

import java.util.List;

import com.anshul.model.Company;
import com.anshul.model.Criteria;
import com.anshul.model.CriteriaType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/admin")
@PreAuthorize("hasAuthority('ADMIN')")
public class AdminController {

	@Autowired
	CompanyService companyService;

	@Autowired
	CriteriaService criteriaService;

	@GetMapping
	public String admin_home() {
		return "admin_home";
	}

	@GetMapping("company")
	public String companyList(Model model) {

		List<Company> companies = companyService.getAll();
		model.addAttribute("companies", companies);

		return "admin_companyList";
	}

	@GetMapping("company/{id}")
	public String companyDetails(@PathVariable int id, Model model) {

		Company company = companyService.getDetails(id);
		List<CriteriaType> allCriterias = criteriaService.getCriteriaTypes();
		model.addAttribute("allCriterias", allCriterias);

		model.addAttribute("company", company);
		return "admin_companyDetails";
	}

	@PostMapping("company/update")
	public String updateCompanyDetails(@ModelAttribute Company comp, BindingResult result) {

		companyService.updateCompany(comp);
		System.out.println(comp.getName());
		return "redirect:/admin/company";
	}

	@PostMapping("company/add")
	public String addCompany() {
		companyService.createNew();
		return "redirect:/admin/company";
	}

	@GetMapping("company/delete/{id}")
	public String deleteCompany(@PathVariable int id) {
		companyService.delete(id);
		return "redirect:/admin/company";
	}

	@PostMapping("criteria/add")
	public String addCriteria(@RequestParam int comp_id) {
		System.out.println(comp_id);
		criteriaService.createNew(comp_id);
		return "redirect:/admin/company/" + Integer.toString(comp_id);
	}

	@PostMapping("criteria/update")
	public String updateCriteria(@ModelAttribute Criteria criteria) {
		System.out.println(criteria);
		criteriaService.update(criteria);
		return "redirect:/admin/company/" + Integer.toString(criteria.getCompany_id());
	}

	@PostMapping("criteria/delete")
	public String deleteCriteria(@RequestParam int id, @RequestParam int company_id) {
		System.out.println(id);
		criteriaService.delete(id);
		return "redirect:/admin/company/" + Integer.toString(company_id);
	}

	@PostMapping("specialisation/delete")
	public String deleteSpecialisation(@RequestParam int id, @RequestParam int company_id) {
		System.out.println(id);
		criteriaService.deleteSpecialisation(id);
		return "redirect:/admin/company/" + Integer.toString(company_id);
	}

	@PostMapping("specialisation/add")
	public String addSpecialisation(@RequestParam int criteria_id, @RequestParam int company_id,
			@RequestParam String specialisation) {
		System.out.println(specialisation);
		criteriaService.addSpecialisation(criteria_id, specialisation);
		return "redirect:/admin/company/" + Integer.toString(company_id);
	}

}
