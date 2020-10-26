package com.anshul.controller;

import java.security.Principal;

import com.anshul.model.PersonalProfile;
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

    @GetMapping
    public String opportunities(Principal principal, Model model) {
        PersonalProfile user = personalProfileService.getFromUsername(principal.getName());
        model.addAttribute("profile", user);

        return "Opportunities";
    }

}
