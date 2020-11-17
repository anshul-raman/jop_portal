package com.anshul.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.anshul.model.Willingness;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class WillingnessRepository {

    @Autowired
    JdbcTemplate template;

    public List<Willingness> getAll(int id) {
        String query = "select W.*, C.name as c_name, C.profile as c_profile, "
                + "C.job_description as c_description, R.name as r_name from willingness  W, "
                + "companies C, resumes  R where W.company_id = C.id and W.resume_id = R.id and W.user_id = ?";

        return template.query(query, new Object[] { id }, new RowMapper<Willingness>() {

            @Override
            public Willingness mapRow(ResultSet rs, int rowNum) throws SQLException {
                Willingness c = new Willingness();
                c.setUser_id(rs.getInt("user_id"));
                c.setCompany_id(rs.getInt("company_id"));
                c.setResume_id(rs.getInt("resume_id"));
                c.getCompany().setId(rs.getInt("company_id"));
                c.getCompany().setJob_description(rs.getString("c_description"));
                c.getCompany().setName(rs.getString("c_name"));
                c.getCompany().setProfile(rs.getString("c_profile"));
                c.getResume().setId(rs.getInt("resume_id"));
                c.getResume().setName(rs.getString("r_name"));
                return c;
            }

        });
    }

    public void create(int user_id, int company_id, int resume_id) {
        String query = "insert into willingness (user_id , company_id, resume_id) values (?, ?, ?)";
        template.update(query, user_id, company_id, resume_id);
    }

    public void delete(int id, int company_id) {
        String query = "delete from willingness where user_id = ? and company_id = ? ";
        template.update(query, id, company_id);
    }

}
