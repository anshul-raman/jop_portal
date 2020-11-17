package com.anshul.repository;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import com.anshul.model.Result;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

@Repository
public class ResultRepository {

    @Autowired
    JdbcTemplate template;

    public void createNewFromStudentId(int id) {
        String query = " insert into results (student) values (?) ";

        template.update(query, id);

    }

    public void update(Result result) {

        // System.out.println("HERE" + result);

        String query = "update results set result_type = ?,  year = ?, "
                + " univ_id = ?, specialisation = ?, cgpa = ?, " + "  marks = ? , percentage = ?, backlogs = ? "
                + " where id = ? ";

        template.update(query, result.getResult_type(), result.getYear(), result.getUniv_id(),
                result.getSpecialisation(), result.getCgpa(), result.getMarks(), result.getPercentage(),
                result.getBacklogs(), result.getId());
    }

    public void updateVerificationStatus(int id, boolean status) {
        String query = "update results set is_verified = ? where id = ? ";
        template.update(query, status, id);
    }

    public void deleteFromId(int id) {
        String query = "delete from results where id = ? ";
        template.update(query, id);
    }

    public List<Result> getResultsFromId(int id) {

        String query = "select * from results where student = ? ";
        return template.query(query, new Object[] { id }, new RowMapper<Result>() {

            @Override
            public Result mapRow(ResultSet rs, int rowNum) throws SQLException {
                Result result = new Result();
                result.setId(rs.getInt("id"));
                result.setResult_type(rs.getInt("result_type"));
                result.setStudent(rs.getInt("student"));
                result.setYear(rs.getInt("year"));
                result.setUniv_id(rs.getInt("univ_id"));
                result.setSpecialisation(rs.getString("specialisation"));
                result.setCgpa(rs.getFloat("cgpa"));
                result.setMarks(rs.getFloat("marks"));
                result.setPercentage(rs.getFloat("percentage"));
                result.setBacklogs(rs.getInt("backlogs"));
                result.setIs_verified(rs.getBoolean("is_verified"));
                return result;
            }

        });
    }

}
