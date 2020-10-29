package com.anshul.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.anshul.model.Company;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

@Repository
public class CompanyRepository {

    @Autowired
    JdbcTemplate template;

    @Autowired
    NamedParameterJdbcTemplate namedTemplate;

    public List<Company> getAll() {
        String query = "select * from companies order by id desc ";
        return template.query(query, new RowMapper<Company>() {

            @Override
            public Company mapRow(ResultSet rs, int rowNum) throws SQLException {
                Company c = new Company();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setProfile(rs.getString("profile"));
                c.setJob_description(rs.getString("job_description"));
                return c;
            }
            
        });
    }

    public Company getFromId(int id){
        String query = "Select * from companies where id = ?";
        return template.queryForObject(query, new Object[] {id} ,new RowMapper<Company>() {

            @Override
            public Company mapRow(ResultSet rs, int rowNum) throws SQLException {
                Company c = new Company();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                c.setProfile(rs.getString("profile"));
                c.setJob_description(rs.getString("job_description"));
                return c;
            }
            
        });
    }

    public void update(Company company){
        String query = "update companies set " +
                        "name = ?, " + 
                        " profile = ?, " + 
                        "job_description = ? " +
                        "where id = ?";
        template.update(query, company.getName(),
                                company.getProfile(),
                                company.getJob_description(),
                                company.getId());                
    }

    public int createNew() {

        String query = "INSERT INTO companies DEFAULT VALUES";
        KeyHolder holder = new GeneratedKeyHolder();
        namedTemplate.update(query, new MapSqlParameterSource(), holder, new String[] { "id" });
        return (int) holder.getKey();

    }

    public void deleteFromId(int id) {
        String query = "delete from companies where id = ? ";
        template.update(query, id);
    }

}
