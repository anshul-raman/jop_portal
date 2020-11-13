package com.anshul.controller;

import java.security.Principal;
import java.util.List;

import com.anshul.model.PersonalProfile;
import com.anshul.model.Resume;
import com.anshul.model.ResumeField;
import com.anshul.service.PersonalProfileService;
import com.anshul.service.ResumeService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/resume")
public class ResumeController {

    @Autowired
    PersonalProfileService personalProfileService;

    @Autowired
    ResumeService resumeService;

    @GetMapping
    public String resume(Principal principal, Model model) {

        PersonalProfile user = personalProfileService.getFromUsername(principal.getName());
        List<Resume> resumes = resumeService.getAllResume(user.getId());
        List<ResumeField> resumeFields = resumeService.getAllFields(user.getId());

        for(var x : resumeFields){
            System.out.println(x.getId());
        }

        model.addAttribute("profile", user);
        model.addAttribute("resumes", resumes);
        model.addAttribute("resume_fields", resumeFields);

        return "Resume";
    }

    @GetMapping("addField")
    public String addField(Principal principal) {
        PersonalProfile user = personalProfileService.getFromUsername(principal.getName());

        resumeService.createField(user.getId());

        return "redirect:/resume";
    }

}
