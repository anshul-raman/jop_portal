package com.anshul.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.anshul.model.Criteria;
import com.anshul.model.CriteriaSpecialisation;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class CriteriaRepository {

	@Autowired
	JdbcTemplate template;

	@Autowired
	CriteriaTypeRepository criteriaTypeRepository;

	public List<Criteria> getFromCompanyID(int id) {
		String query = "select * from criterias where company_id = ? ";
		List<Criteria> res = template.query(query, new Object[] { id }, new RowMapper<Criteria>() {

			@Override
			public Criteria mapRow(ResultSet rs, int rowNum) throws SQLException {
				Criteria c = new Criteria();
				c.setId(rs.getInt("id"));
				c.setType(rs.getInt("type"));
				c.setCompany_id(rs.getInt("company_id"));
				c.setYear_min(rs.getInt("year_min"));
				c.setYear_max(rs.getInt("year_max"));
				c.setMin_cgpa(rs.getFloat("min_cgpa"));

				c.setMin_percentage(rs.getFloat("min_percentage"));

				c.setMin_marks(rs.getFloat("min_marks"));
				c.setAllowed_backlogs(rs.getInt("allowed_backlogs"));

				return c;

			}

		});

		for (Criteria c : res) {
			List<CriteriaSpecialisation> specialisatons = getCriteriaSpecialisations(c.getId());
			c.setSpecialisatons(specialisatons);
			c.setType_details(criteriaTypeRepository.getFromId(c.getType()));
		}

		return res;
	}

	private List<CriteriaSpecialisation> getCriteriaSpecialisations(int id) {
		String query = "select * from criteria_specialisations where criteria_id = ? ";

		return template.query(query, new Object[] { id }, new RowMapper<CriteriaSpecialisation>() {

			@Override
			public CriteriaSpecialisation mapRow(ResultSet rs, int rowNum) throws SQLException {
				CriteriaSpecialisation c = new CriteriaSpecialisation();
				c.setId(rs.getInt("id"));
				c.setCriteria_id(rs.getInt("criteria_id"));
				c.setSpecialisation(rs.getString("specialisation"));
				return c;
			}

		});
	}

	public void createFromCompanyId(int comp_id) {
		String query = " insert into criterias (company_id) values (?) ";
		template.update(query, comp_id);
	}

	public void update(Criteria criteria) {
		String query = "update criterias set type = ?, year_min = ?, year_max = ?, "
				+ " min_cgpa = ?, min_marks = ?, min_percentage = ?, allowed_backlogs = ? where id = ? ";
				
		template.update(query, criteria.getType(), criteria.getYear_min(), criteria.getYear_max(),
				criteria.getMin_cgpa(), criteria.getMin_marks(), criteria.getMin_percentage(),
				criteria.getAllowed_backlogs(), criteria.getId());
	}

	public void deleteFromId(int id) {
		String query = " delete from criterias where id =  ? ";
		template.update(query, id);
	}

	public void deleteSpecialisation(int id) {
		String query = " delete from criteria_specialisations  where id = ? ";
		template.update(query, id);
	}

	public void addSpecialisation(int criteria_id, String specialisation) {
		String query = "insert into criteria_specialisations (criteria_id , specialisation) values ( ?, ?)";
		template.update(query, criteria_id, specialisation);
	}

}
