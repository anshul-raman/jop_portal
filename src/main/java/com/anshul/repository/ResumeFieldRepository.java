package com.anshul.repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.anshul.model.ResumeField;
import com.anshul.model.Resume;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
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
        String query = "select * from fields where user_id = ? order by title";

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

    public List<ResumeField> getFromResumeId(int id) {
        String query = "select * from fields join resume_fields on fields.id = resume_fields.field_id where resume_fields.resume_id = ?";

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

    public void delete(int id) {
        String query = "delete from fields where id = ? ";
        template.update(query, id);

    }

    public void update(ResumeField field) {
        String query = "update fields set title = ?, description = ?, duration = ? where id = ? ";
        template.update(query, field.getTitle(), field.getDescription(), field.getDuration(), field.getId());
    }

    public void deleteFromResumeId(int id) {
        String query = "delete from resume_fields where resume_id = ? ";
        template.update(query, id);
    }

    public void addFromResume(Resume res) {
        String query = "insert into resume_fields (field_id, resume_id) values (?, ?)";

        List<Integer> fieldIds = new ArrayList<Integer>(res.getResumeFieldIds());

        template.batchUpdate(query, new BatchPreparedStatementSetter() {

            @Override
            public void setValues(PreparedStatement ps, int i) throws SQLException {

                ps.setInt(1, fieldIds.get(i));
                ps.setInt(2, res.getId());

            }

            @Override
            public int getBatchSize() {
                return fieldIds.size();

            }

        });
    }


    public void verify(int field_id, String verifier){
        String query = "update fields set verified = true, "+
                        "verified_by = (select user_id from users where username = ?) "+
                        "where id = ? ";
        template.update(query, verifier, field_id);
    }

	public void unverify(int field_id) {
        String query = "update fields set verified = false where id = ?";
        template.update(query, field_id);
	}

}
