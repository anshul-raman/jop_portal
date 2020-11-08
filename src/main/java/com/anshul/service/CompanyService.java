package com.anshul.service;

import java.util.ArrayList;
import java.util.List;

import com.anshul.model.Company;
import com.anshul.model.Criteria;
import com.anshul.model.PersonalProfile;
import com.anshul.model.Result;
import com.anshul.repository.CompanyRepository;
import com.anshul.repository.CriteriaRepository;
import com.anshul.repository.ResultRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CompanyService {

    @Autowired
    CompanyRepository companyRepository;

    @Autowired
    CriteriaRepository criteriaRepository;

    @Autowired
    ResultRepository resultRepository;

    public List<Company> getAll() {
        return companyRepository.getAll();
    }

    public Company getDetails(int id) {
        Company comp = companyRepository.getFromId(id);
        comp.setCriteria(criteriaRepository.getFromCompanyID(comp.getId()));

        return comp;
    }

    public void updateCompany(Company comp) {

        companyRepository.update(comp);

    }

    public List<Company> getByUser(PersonalProfile user) {
        List<Company> companies = this.getAll();

        // System.out.println(companies);

        var result = new ArrayList<Company>();
        for (Company c : companies) {
            if (userCanApply(user, c)) {
                result.add(c);
            }
        }

        // System.out.println(result);

        return result;
    }

    private boolean userCanApply(PersonalProfile user, Company c) {
        c = this.getDetails(c.getId());
        var userResults = resultRepository.getResultsFromId(user.getId());
        System.out.println(userResults.size());
        if (c.getCriteria().isEmpty())
            return true;

        boolean UserCanApply = true;

        // System.out.println(c);

        for (Criteria crit : c.getCriteria()) {

            // System.out.println(crit.getSpecialisatons());
            // System.out.println(crit);

            boolean valid = false;
            for (Result res : userResults) {
                // System.out.println(res);

                if (valid)
                    break;

                if (crit.getType() != res.getResult_type()) {
                    // System.out.println(crit.getType());
                    // System.out.println(res.getResult_type());
                    continue;
                }

                if (crit.getAllowed_backlogs() < res.getBacklogs()) {
                    // System.out.println(crit.getAllowed_backlogs());
                    // System.out.println(res.getBacklogs());
                    continue;
                }

                if (crit.getMin_cgpa() > res.getCgpa()) {
                    // System.out.println(crit.getMin_cgpa());
                    // System.out.println(res.getCgpa());
                    continue;
                }

                if (crit.getMin_marks() > res.getMarks()) {
                    // System.out.println(crit.getMin_marks());
                    // System.out.println(res.getMarks());
                    continue;
                }

                if (crit.getMin_percentage() > res.getPercentage()) {
                    // System.out.println(crit.getMin_percentage());
                    // System.out.println(res.getPercentage());
                    continue;
                }

                valid = true;

            }
            // System.out.println(valid);
            UserCanApply = UserCanApply & valid;
        }

        return UserCanApply;
    }

    public void createNew() {
        companyRepository.createNew();
    }

    public void delete(int id) {
        companyRepository.deleteFromId(id);
    }

}
