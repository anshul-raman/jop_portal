package com.anshul.service;

import java.util.List;

import com.anshul.model.CriteriaType;
import com.anshul.repository.CriteriaTypeRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CriteriaService {
    
    @Autowired
    CriteriaTypeRepository criteriaTypeRepository;

    public List<CriteriaType> getCriteriaTypes(){
        return criteriaTypeRepository.getAll();
    }


}
