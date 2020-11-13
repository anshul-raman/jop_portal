package com.anshul.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.anshul.model.ResumeField;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class ResumeFieldRepository {

    @Autowired
    JdbcTemplate template;

    public void createNew(int id) {
        String query = "insert into fields (user_id ) values (?)";
        template.update(query, id);
    }

    public List<ResumeField> getAll(int id) {
        String query = "select * from fields where user_id = ?";

        return template.query(query, new Object[] { id }, new RowMapper<ResumeField>() {

        
			@Override
			public ResumeField mapRow(ResultSet rs, int rowNum) throws SQLException {
                ResumeField rf = new ResumeField();
                rf.setId(rs.getInt("id"));
                rf.setUser_id(rs.getInt("user_id"));
                rf.setVerified(rs.getBoolean("verified"));
                rf.setVerified_by(rs.getInt("verified_by"));
                rf.setTitle(rs.getString("title"));
                rf.setDescription(rs.getString("description"));
                rf.setDuration(rs.getString("duration"));
				return rf;
			}

        });
    }

}
