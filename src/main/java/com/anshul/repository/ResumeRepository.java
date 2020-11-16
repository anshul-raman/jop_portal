package com.anshul.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.anshul.model.Resume;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class ResumeRepository {

	@Autowired
	JdbcTemplate template;

	public void create(int id) {
		String query = "insert into resumes (user_id, name ) values (?, ?)";
		template.update(query, id, "NEW RESUME");
	}

	public List<Resume> getAll(int id) {
		String query = "select * from resumes where user_id = ? ";

		return template.query(query, new Object[] { id }, new RowMapper<Resume>() {

			@Override
			public Resume mapRow(ResultSet rs, int rowNum) throws SQLException {
				Resume rf = new Resume();
				rf.setId(rs.getInt("id"));
				rf.setUser_id(rs.getInt("user_id"));
				rf.setName(rs.getString("name"));

				return rf;
			}

		});
	}

	public void delete(int id) {
		String query = "delete from resumes where id = ?";
		template.update(query, id);

	}

	public void update( Resume res ){
		String query = "update resumes set name = ? where id = ? ";
		template.update(query,  res.getName(), res.getId());
	}
    
}
