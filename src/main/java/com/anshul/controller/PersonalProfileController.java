package com.anshul.controller;

import java.security.Principal;
import java.util.List;

import com.anshul.model.Address;
import com.anshul.model.CriteriaType;
import com.anshul.model.PersonalProfile;
import com.anshul.model.Result;
import com.anshul.model.University;
import com.anshul.service.CriteriaService;
import com.anshul.service.PersonalProfileService;
import com.anshul.service.UniversityService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.view.RedirectView;

@Controller
@RequestMapping("/personalprofile")
public class PersonalProfileController {

    @Autowired
    PersonalProfileService personalProfileService;

    @Autowired
    UniversityService universityService;

    @Autowired
    CriteriaService criteriaService;


    @GetMapping
    public String home(Principal principal, Model model) {

        PersonalProfile user = personalProfileService.getFromUsername(principal.getName());
        List<Result> results = personalProfileService.getResults(user.getId());
        List<University> universities = universityService.getUniversities();
        List<CriteriaType> allCriterias = criteriaService.getCriteriaTypes();
        model.addAttribute("profile", user);
        model.addAttribute("results", results);
        model.addAttribute("universities", universities);
        model.addAttribute("allCriterias", allCriterias);
        return "PersonalProfile";
    }

    @PostMapping("updatedetails")
    public RedirectView updatedetails(@ModelAttribute("personalprofile") PersonalProfile person, BindingResult result,
            RedirectAttributes attr) {

        RedirectView redirectView = new RedirectView("/personalprofile", true);

        if (result.hasErrors()) {

            attr.addFlashAttribute("response", "Error");
        } else {

            personalProfileService.updateOnlyPersonalDetails(person);
            attr.addFlashAttribute("response", "Updated Successfully");
        }
        // System.out.println("Controller\n" + person);
        return redirectView;
    }

    @PostMapping(value = "updateaddress")
    public RedirectView updateaddress(@ModelAttribute Address address, BindingResult result, RedirectAttributes attr) {

        RedirectView redirectView = new RedirectView("/personalprofile", true);

        if (result.hasErrors()) {

            attr.addFlashAttribute("response", "Error");
        } else {

            if(address.isValid()){
                personalProfileService.updateAddress(address);
                attr.addFlashAttribute("response", "Updated Successfully");
            }else{
                attr.addFlashAttribute("response", "Error");
            }

           
        }

        // System.out.println("Controller\n" + address);

        return redirectView;

    }

    @PostMapping("addNewResult")
    public RedirectView addNewResult(@RequestParam int id, RedirectAttributes attr) {
        RedirectView redirectView = new RedirectView("/personalprofile", true);

        try {
            personalProfileService.createResult(id);
            attr.addFlashAttribute("response", "Result Added, Please add other details");
        } catch (Exception e) {

            attr.addFlashAttribute("response", "Error");
        }

        return redirectView;

    }

    @PostMapping("deleteResult")
    public RedirectView deleteResult(@RequestParam int id, RedirectAttributes attr) {
        RedirectView redirectView = new RedirectView("/personalprofile", true);

        try {
            personalProfileService.deleteResult(id);
            attr.addFlashAttribute("response", "Result Deleted");
        } catch (Exception e) {

            attr.addFlashAttribute("response", "Error");
        }

        return redirectView;

    }

    @PostMapping("updateResult")
    public RedirectView updateResult(@ModelAttribute Result result, BindingResult bindingResult,
            RedirectAttributes attr) {
        RedirectView redirectView = new RedirectView("/personalprofile", true);

        if (bindingResult.hasErrors()) {

            attr.addFlashAttribute("response", "Error with form data");
        } else {
            System.out.println(result);
            try {
                personalProfileService.updateResult(result);
                attr.addFlashAttribute("response", "Result Updates");
            } catch (Exception e) {

                attr.addFlashAttribute("response", e);
            }
        }

        return redirectView;

    }

}
