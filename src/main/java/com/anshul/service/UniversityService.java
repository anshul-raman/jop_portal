package com.anshul.service;

import java.util.List;

import com.anshul.model.University;
import com.anshul.repository.UniversityRespository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UniversityService {

    @Autowired
    UniversityRespository universityRespository;

    public List<University> getUniversities(){
        return universityRespository.getAll();
    }
}
