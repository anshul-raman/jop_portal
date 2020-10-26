package com.anshul.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.anshul.model.University;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class UniversityRespository {

    @Autowired
    JdbcTemplate template;

    public List<University> getAll() {
        String query = "select * from universities ";
        return template.query(query, new RowMapper<University>() {

            @Override
            public University mapRow(ResultSet rs, int rowNum) throws SQLException {
                University u = new University();
                u.setId(rs.getInt("id"));
                u.setName(rs.getString("name"));
                return u;
            }

        });

    }

    public University getFromId(int univ_id) {
        String query = "select * from universities where id = ?";
        return template.queryForObject(query, new Object[] { univ_id }, new RowMapper<University>() {

            @Override
            public University mapRow(ResultSet rs, int rowNum) throws SQLException {
                University u = new University();
                u.setId(rs.getInt("id"));
                u.setName(rs.getString("name"));
                return u;
            }
                
            });
    }


}
