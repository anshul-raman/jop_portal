package com.anshul.controller;

import java.security.Principal;
import java.util.List;

import com.anshul.model.Company;
import com.anshul.model.PersonalProfile;
import com.anshul.service.CompanyService;
import com.anshul.service.PersonalProfileService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
@RequestMapping("/opportunities")
public class OpportunitiesController {

    @Autowired
    PersonalProfileService personalProfileService;

    @Autowired
    CompanyService companyService;

    @GetMapping
    public String opportunities(Principal principal, Model model) {
        PersonalProfile user = personalProfileService.getFromUsername(principal.getName());
        List<Company> companies = companyService.getByUser(user);
        model.addAttribute("profile", user);
        model.addAttribute("companies", companies);
        return "Opportunities";
    }

}
