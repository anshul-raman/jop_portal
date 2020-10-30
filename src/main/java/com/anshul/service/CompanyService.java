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


    public List<Company> getAll(){
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
        var result = new ArrayList<Company>();
        for(Company c : companies){
            if(userCanApply(user, c)){
                result.add(c);
            }
        }
        return result;
	}

    private boolean userCanApply(PersonalProfile user, Company c) {
        c = this.getDetails(c.getId());
        var userResults = resultRepository.getResultsFromId(user.getId());
        if(c.getCriteria().isEmpty())
            return true;
        
        boolean UserCanApply = true;

        for(Criteria crit : c.getCriteria()){

            if(!UserCanApply)
                return false;

            boolean valid = false;
            for(Result res : userResults){

                if(valid)
                    break;

                if(crit.getType() != res.getResult_type())
                    break;

                if(crit.getAllowed_backlogs() < res.getBacklogs())
                    break;

                if(crit.getMin_cgpa() < res.getCgpa())
                    break;

                if(crit.getMin_marks() < res.getMarks())
                    break;
                
                if(crit.getMin_percentage() < res.getPercentage())
                    break;


                valid = true;
               
            }

            UserCanApply = UserCanApply & valid;
        }

        return UserCanApply;
    }

}
