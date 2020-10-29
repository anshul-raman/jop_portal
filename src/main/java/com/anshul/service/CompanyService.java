package com.anshul.service;

import java.util.List;

import com.anshul.model.Company;
import com.anshul.repository.CompanyRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CompanyService {
    

    @Autowired
    CompanyRepository companyRepository;


    public List<Company> getAll(){
        return companyRepository.getAll();
    }


	public Company getDetails(int id) {
		return null;
	}

}
