package com.anshul.controller;

import com.anshul.service.CompanyService;
import com.anshul.service.CriteriaService;

import java.util.HashMap;
import java.util.List;

import com.anshul.model.Company;
import com.anshul.model.Criteria;
import com.anshul.model.CriteriaType;
import com.anshul.model.PersonalProfile;
import com.anshul.model.ResumeField;
import com.anshul.model.University;
import com.anshul.model.Willingness;
import com.anshul.service.PersonalProfileService;
import com.anshul.service.ResumeService;
import com.anshul.service.UniversityService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/admin")
@PreAuthorize("hasAuthority('ADMIN')")
public class AdminController {

	@Autowired
	CompanyService companyService;

	@Autowired
	CriteriaService criteriaService;

	@Autowired
	PersonalProfileService personalProfileService;

	@Autowired
	ResumeService resumeService;


	@Autowired
	UniversityService universityService;

	@GetMapping
	public String admin_home() {
		return "admin/home";
	}

	@GetMapping("company")
	public String companyList(Model model) {

		List<Company> companies = companyService.getAll();
		model.addAttribute("companies", companies);
		return "admin/companyList";
	}

	@GetMapping("company/{id}")
	public String companyDetails(@PathVariable int id, Model model) {

		Company company = companyService.getDetails(id);
		List<CriteriaType> allCriterias = criteriaService.getCriteriaTypes();
		model.addAttribute("allCriterias", allCriterias);
		model.addAttribute("company", company);
		return "admin/companyDetails";
	}

	@PostMapping("company/update")
	public String updateCompanyDetails(@ModelAttribute Company comp, BindingResult result) {

		companyService.updateCompany(comp);
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

	@GetMapping("company/willingness/{id}")
	public String willingStudents(@PathVariable int id, Model model) {
		List<Willingness> willingnesses = companyService.getWillingnessFromCompanyId(id);
		model.addAttribute("willingnessess", willingnesses);

		return "admin/Willingstudents";
	}

	@PostMapping("criteria/add")
	public String addCriteria(@RequestParam int comp_id) {
		criteriaService.createNew(comp_id);
		return "redirect:/admin/company/" + Integer.toString(comp_id);
	}

	@PostMapping("criteria/update")
	public String updateCriteria(@ModelAttribute Criteria criteria) {

		criteriaService.update(criteria);
		return "redirect:/admin/company/" + Integer.toString(criteria.getCompany_id());
	}

	@PostMapping("criteria/delete")
	public String deleteCriteria(@RequestParam int id, @RequestParam int company_id) {

		criteriaService.delete(id);
		return "redirect:/admin/company/" + Integer.toString(company_id);
	}

	@PostMapping("specialisation/delete")
	public String deleteSpecialisation(@RequestParam int id, @RequestParam int company_id) {

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

	@GetMapping("students")
	public String students(Model model) {

		List<PersonalProfile> students = personalProfileService.getAllStudents();
		model.addAttribute("students", students);
		return "admin/Students";
	}

	@GetMapping("students/{id}")
	public String studentDetails(Model model, @PathVariable int id) {

		PersonalProfile profile = personalProfileService.getFromUserId(id);
		List<ResumeField> resumeFields = resumeService.getAllFields(profile.getId());
		model.addAttribute("user", profile);
		model.addAttribute("resumeFields", resumeFields);
		return "admin/StudentDetails";

	}

	@PostMapping("students/fieldVerification")
	public @ResponseBody HashMap<String, String> fieldVerification(@RequestParam int field_id,
			@RequestParam String verifier, @RequestParam String method) {
		var hm = new HashMap<String, String>();
		

		if(method.equals("verify")){
			try {
				resumeService.verifyFieldByVerifierUsername(field_id, verifier);
				hm.put("response", "Field Verified");
			} catch (Exception e) {
				hm.put("response", e.getMessage());
			}
			
		}else{
			try {
				resumeService.unverifyField(field_id);
				hm.put("response", "Field Unverified");
			} catch (Exception e) {
				hm.put("response", e.getMessage());
			}

			
		}

		return hm;
	}



	@GetMapping("universities")
	public String getUniversities(Model model){
		List<University> universities = universityService.getUniversities();
		model.addAttribute("universities", universities);
		return "admin/Universities";
	}

}
