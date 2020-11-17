package com.anshul.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

import com.anshul.model.Address;
import com.anshul.model.PersonalProfile;
import com.anshul.model.Result;
import com.anshul.repository.AddressRepository;
import com.anshul.repository.CriteriaTypeRepository;
import com.anshul.repository.PersonalProfileRepository;
import com.anshul.repository.RegistrationRepository;
import com.anshul.repository.ResultRepository;
import com.anshul.repository.UniversityRespository;

@Service
public class PersonalProfileService {

	@Autowired
	RegistrationRepository registrationRepository;

	@Autowired
	AddressRepository addressRepository;

	@Autowired
	PersonalProfileRepository personalProfileRepository;

	@Autowired
	ResultRepository resultRepository;

	@Autowired
	UniversityRespository universityRespository;

	@Autowired
	CriteriaTypeRepository criteriaTypeRepository;

	public void registerUser(String username, String password) {
		registrationRepository.registerUser(username, password);

		PersonalProfile person = personalProfileRepository.createNewFromUsername(username);

		person.setCurrent_address_fk(addressRepository.createNew());
		person.setPermanent_address_fk(addressRepository.createNew());

		this.update(person);

	}

	public void update(PersonalProfile person) {
		personalProfileRepository.update(person);

		person.getCurrent_address().setId(person.getCurrent_address_fk());
		person.getPermanent_address().setId(person.getPermanent_address_fk());

		addressRepository.update(person.getCurrent_address());
		addressRepository.update(person.getPermanent_address());
	}

	public PersonalProfile getFromUsername(String username) {
		PersonalProfile ps = personalProfileRepository.getFromUsername(username);
		ps.setCurrent_address(addressRepository.getFromId(ps.getCurrent_address_fk()));
		ps.setPermanent_address(addressRepository.getFromId(ps.getPermanent_address_fk()));
		return ps;
	}

	public PersonalProfile getFromUserId(int user_id) {
		PersonalProfile ps = personalProfileRepository.getFromUserId(user_id);
		ps.setCurrent_address(addressRepository.getFromId(ps.getCurrent_address_fk()));
		ps.setPermanent_address(addressRepository.getFromId(ps.getPermanent_address_fk()));
		return ps;
	}

	public PersonalProfile getFromUsername_min(String username) {
		PersonalProfile ps = personalProfileRepository.getFromUsername(username);
		// ps.setCurrent_address(addressRepository.getFromId(ps.getCurrent_address_fk()));
		// ps.setPermanent_address(addressRepository.getFromId(ps.getPermanent_address_fk()));
		return ps;
	}

	public void updateOnlyPersonalDetails(PersonalProfile person) {
		personalProfileRepository.update(person);
	}

	public void updateAddress(Address address) {
		// System.out.println("HERE\n" + address);
		addressRepository.update(address);
	}

	public List<Result> getResults(int id) {
		List<Result> results = resultRepository.getResultsFromId(id);
		for(Result r : results){
			r.setUniversity(universityRespository.getFromId(r.getUniv_id()));
			r.setResult_type_details(criteriaTypeRepository.getFromId(r.getResult_type()));
		}
		
		return results;
	}

	public void createResult(int id) {
		resultRepository.createNewFromStudentId(id);
	}

	public void deleteResult(int id) {
		resultRepository.deleteFromId(id);
	}

	public void updateResult(Result result){
		resultRepository.update(result);
	}



}
