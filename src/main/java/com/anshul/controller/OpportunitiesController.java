package com.anshul.controller;

import java.security.Principal;
import java.util.List;

import com.anshul.model.Company;
import com.anshul.model.PersonalProfile;
import com.anshul.model.Resume;
import com.anshul.model.Willingness;
import com.anshul.service.CompanyService;
import com.anshul.service.PersonalProfileService;
import com.anshul.service.ResumeService;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
@RequestMapping("/opportunities")
public class OpportunitiesController {

    @Autowired
    PersonalProfileService personalProfileService;

    @Autowired
    ResumeService resumeService;

    @Autowired
    CompanyService companyService;

    @GetMapping
    public String opportunities(Principal principal, Model model) {
        PersonalProfile user = personalProfileService.getFromUsername(principal.getName());
        List<Resume> resumes = resumeService.getAllResume(user.getId());
        List<Company> companies = companyService.getByUser(user);
        List<Willingness> willingnesses = companyService.getWillingnessFromUserId(user.getId());
        model.addAttribute("profile", user);
        model.addAttribute("companies", companies);
        model.addAttribute("resumes", resumes);
        model.addAttribute("willingnesses", willingnesses);
        return "Opportunities";
    }

    @PostMapping("addWillingness")
    public RedirectView addWillingness(@ModelAttribute Willingness will, BindingResult result,
            RedirectAttributes attr) {
        RedirectView redirectView = new RedirectView("/opportunities", true);

        if (result.hasErrors()) {

            attr.addFlashAttribute("response", "Error");
        } else {

            companyService.addWillingness(will);
            attr.addFlashAttribute("response", "Updated Successfully");
        }

        return redirectView;
    }

    @GetMapping("delete/{company_id}")
    public String deleteWillindness(Principal principal, @PathVariable int company_id) {
        PersonalProfile user = personalProfileService.getFromUsername_min(principal.getName());
        companyService.deleteWillindness(user.getId(), company_id);
        return "redirect:/opportunities";
    }

}
