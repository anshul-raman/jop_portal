package com.anshul.service;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

import com.anshul.model.Company;
import com.anshul.model.Criteria;
import com.anshul.model.PersonalProfile;
import com.anshul.model.Result;
import com.anshul.model.Willingness;
import com.anshul.repository.CompanyRepository;
import com.anshul.repository.CriteriaRepository;
import com.anshul.repository.ResultRepository;
import com.anshul.repository.WillingnessRepository;

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

    @Autowired
    WillingnessRepository willingnessRepository;

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

        HashSet<Company> ht = new HashSet<Company>();
        List<Willingness> willingnesses = this.getWillingnessFromUserId(user.getId());
        for (var w : willingnesses) {
            ht.add(w.getCompany());
        }

        var result = new ArrayList<Company>();
        for (Company c : companies) {
            if (!ht.contains(c) && userCanApply(user, c)) {
                result.add(c);
            }
        }

        return result;
    }

    private boolean userCanApply(PersonalProfile user, Company c) {
        c = this.getDetails(c.getId());
        var userResults = resultRepository.getResultsFromId(user.getId());
        // System.out.println(userResults.size());
        if (c.getCriteria().isEmpty())
            return true;

        boolean UserCanApply = true;

        for (Criteria crit : c.getCriteria()) {

            boolean valid = false;
            for (Result res : userResults) {

                if (valid)
                    break;

                if (crit.getType() != res.getResult_type()) {

                    continue;
                }

                if (crit.getAllowed_backlogs() < res.getBacklogs()) {

                    continue;
                }

                if (crit.getMin_cgpa() > res.getCgpa()) {

                    continue;
                }

                if (crit.getMin_marks() > res.getMarks()) {

                    continue;
                }

                if (crit.getMin_percentage() > res.getPercentage()) {

                    continue;
                }

                valid = true;

            }

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

    public List<Willingness> getWillingnessFromUserId(int id) {
        return willingnessRepository.getAll(id);
    }

    public void addWillingness(Willingness w){
        this.addWillingness(w.getUser_id(), w.getCompany_id(), w.getResume_id());
    }

    public void addWillingness(int user_id, int company_id, int resume_id){
        willingnessRepository.create(user_id, company_id, resume_id);
    }

	public void deleteWillindness(int id, int company_id) {
        willingnessRepository.delete(id, company_id);
	}

}
