package com.anshul.service;

import java.util.List;

import com.anshul.model.Criteria;
import com.anshul.model.CriteriaType;
import com.anshul.repository.CriteriaRepository;
import com.anshul.repository.CriteriaTypeRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CriteriaService {
    
    @Autowired
	CriteriaTypeRepository criteriaTypeRepository;
	
	@Autowired
	CriteriaRepository criteriaRepository;

    public List<CriteriaType> getCriteriaTypes(){
        return criteriaTypeRepository.getAll();
    }

	public void createNew(int comp_id) {
		criteriaRepository.createFromCompanyId(comp_id);

	}

	public void update(Criteria criteria) {
		criteriaRepository.update(criteria);
	}

	public void delete(int id) {
		criteriaRepository.deleteFromId(id);
	}

	public void deleteSpecialisation(int id) {
		criteriaRepository.deleteSpecialisation(id);
	}

	public void addSpecialisation(int criteria_id, String specialisation) {
		criteriaRepository.addSpecialisation(criteria_id, specialisation);
	}


}
