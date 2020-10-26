package com.anshul.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.anshul.model.CriteriaType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class CriteriaTypeRepository {

    @Autowired
    JdbcTemplate template;

    public List<CriteriaType> getAll() {
        String query = "select * from criteria_types ";
        return template.query(query, new RowMapper<CriteriaType>() {

            @Override
            public CriteriaType mapRow(ResultSet rs, int rowNum) throws SQLException {
                CriteriaType c = new CriteriaType();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                return c;
            }

        });
    }

    public CriteriaType getFromId(int id) {
        String query = "select * from criteria_types where id = ?";
        return template.queryForObject(query, new Object[] { id }, new RowMapper<CriteriaType>() {

            @Override
            public CriteriaType mapRow(ResultSet rs, int rowNum) throws SQLException {
                CriteriaType u = new CriteriaType();
                u.setId(rs.getInt("id"));
                u.setName(rs.getString("name"));
                return u;
            }

        });
    }

}
