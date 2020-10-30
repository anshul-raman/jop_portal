package com.anshul.service;

import java.util.List;

import com.anshul.model.Company;
import com.anshul.repository.CompanyRepository;
import com.anshul.repository.CriteriaRepository;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CompanyService {
    

    @Autowired
    CompanyRepository companyRepository;

    @Autowired 
    CriteriaRepository criteriaRepository;


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

}
