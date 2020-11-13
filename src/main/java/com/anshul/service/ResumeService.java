package com.anshul.service;

import java.util.List;

import com.anshul.model.Resume;
import com.anshul.model.ResumeField;
import com.anshul.repository.ResumeFieldRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ResumeService {


    @Autowired
    ResumeFieldRepository resumeFieldRepository;

	public void createField(int id) {
        resumeFieldRepository.createNew(id);
	}

	public List<Resume> getAllResume(int id) {
		return null;
	}

	public List<ResumeField> getAllFields(int id) {
		return resumeFieldRepository.getAll(id);
	}


}
