package com.anshul.service;

import java.util.HashSet;
import java.util.List;

import com.anshul.model.Resume;
import com.anshul.model.ResumeField;
import com.anshul.repository.ResumeFieldRepository;
import com.anshul.repository.ResumeRepository;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class ResumeService {

	@Autowired
	ResumeFieldRepository resumeFieldRepository;

	@Autowired
	ResumeRepository resumeRepository;

	public void createField(int id) {
		resumeFieldRepository.createNew(id);
	}

	public List<Resume> getAllResume(int id) {
		List<Resume> resumes =  resumeRepository.getAll(id);

		for(Resume res : resumes){
			res.setResumeFields(resumeFieldRepository.getFromResumeId(res.getId()));
			HashSet<Integer> hs = new HashSet<Integer>();
			for(var i : res.getResumeFields()){
				hs.add(i.getId());
			}
			res.setResumeFieldIds(hs);
		}

		return resumes;
	}

	public List<ResumeField> getAllFields(int id) {
		return resumeFieldRepository.getAll(id);
	}

	public void removeField(int id) {
		resumeFieldRepository.delete(id);
	}

	public void updateField(ResumeField field) {
		resumeFieldRepository.update(field);
	}

	public void createResume(int id) {
		resumeRepository.create(id);
	}

}
