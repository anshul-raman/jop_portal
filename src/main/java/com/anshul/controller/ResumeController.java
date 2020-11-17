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
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

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

        // System.out.println(resumes.size());

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

    @GetMapping("removeField/{id}")
    public String removeField(@PathVariable int id) {

        resumeService.removeField(id);

        return "redirect:/resume";
    }

    @PostMapping("updateField")
    public RedirectView updateField(@ModelAttribute ResumeField field, BindingResult result, RedirectAttributes attr) {

        RedirectView redirectView = new RedirectView("/resume", true);

        if (result.hasErrors()) {

            attr.addFlashAttribute("response", "Error");
        } else {

            resumeService.updateField(field);
            attr.addFlashAttribute("response", "Updated Successfully");
        }

        return redirectView;

    }

    @GetMapping("addResume")
    public String addResume(Principal principal) {
        PersonalProfile user = personalProfileService.getFromUsername(principal.getName());

        resumeService.createResume(user.getId());

        return "redirect:/resume";
    }
    
    @GetMapping("deleteResume/{id}")
    public String deleteResume(@PathVariable int id) {

        resumeService.deleteResume(id);

        return "redirect:/resume";
    }

    @PostMapping("updateResume")
    public RedirectView updateResume(@ModelAttribute Resume res, BindingResult result, RedirectAttributes attr) {

        RedirectView redirectView = new RedirectView("/resume", true);

        if (result.hasErrors()) {

            attr.addFlashAttribute("response", "Error");
        } else {

            resumeService.updateResume(res);
            attr.addFlashAttribute("response", "Updated Successfully");
        }

        return redirectView;

    }

}
