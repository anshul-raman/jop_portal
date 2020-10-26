package com.anshul.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.anshul.Auth.User;
import com.anshul.Auth.UserRepository;
import com.anshul.model.PersonalProfile;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;

@Repository
public class PersonalProfileRepository {

    @Autowired
    NamedParameterJdbcTemplate namedTemplate;

    @Autowired
    JdbcTemplate template;

    @Autowired
    AddressRepository addressRepository;

    @Autowired
    UserRepository userRepository;

    public PersonalProfile createNewFromUsername(String username) {
        String query = "insert into personal_profiles (id)"
                + "values ( (select user_id from users where username = :username) )";

        SqlParameterSource parameters = new MapSqlParameterSource().addValue("username", username);

        KeyHolder holder = new GeneratedKeyHolder();

        namedTemplate.update(query, parameters, holder, new String[] { "id" });

        PersonalProfile personalProfile = new PersonalProfile();
        personalProfile.setId((int) holder.getKey());
        return personalProfile;

    }

    public void update(PersonalProfile person) {
        String query = "update  personal_profiles set " + "first_name = :first_name, " + "middle_name = :middle_name, "
                + "last_name = :last_name, " + "dob = :dob, " + "email = :email, " + "fathers_name = :fathers_name, "
                + "mothers_name = :mothers_name, " + "fathers_occupation = :fathers_occupation, "
                + "mothers_occupation = :mothers_occupation, " + "mother_tongue = :mother_tongue, "
                + "current_address_fk = :current_address_fk, " + "permanent_address_fk = :permanent_address_fk "
                + "where id = :id ";

        SqlParameterSource parameters = new MapSqlParameterSource().addValue("first_name", person.getFirst_name())
                .addValue("middle_name", person.getMiddle_name()).addValue("last_name", person.getLast_name())
                .addValue("dob", person.getDob()).addValue("email", person.getEmail())
                .addValue("fathers_name", person.getFathers_name()).addValue("mothers_name", person.getMothers_name())
                .addValue("fathers_occupation", person.getFathers_occupation())
                .addValue("mothers_occupation", person.getMothers_occupation())
                .addValue("mother_tongue", person.getMother_tongue())
                .addValue("permanent_address_fk", person.getPermanent_address_fk())
                .addValue("current_address_fk", person.getCurrent_address_fk()).addValue("id", person.getId());

        namedTemplate.update(query, parameters);



    }

    public  PersonalProfile getFromUsername(String username) {

        User user = userRepository.getUserByUsername(username);
        String query = "select * from personal_profiles where id = ?";
        PersonalProfile ps = template.queryForObject(query, new Object[] { user.getId() },
                new RowMapper<PersonalProfile>() {

                    @Override
                    public PersonalProfile mapRow(ResultSet rs, int rowNum) throws SQLException {
                        PersonalProfile ps = new PersonalProfile();
                        ps.setId(rs.getInt("id"));
                        ps.setFirst_name(rs.getString("first_name"));
                        ps.setMiddle_name(rs.getString("middle_name"));
                        ps.setLast_name(rs.getString("last_name"));
                        ps.setDob(rs.getDate("dob"));
                        ps.setEmail(rs.getString("email"));
                        ps.setFathers_name(rs.getString("fathers_name"));
                        ps.setMothers_name(rs.getString("mothers_name"));
                        ps.setFathers_occupation(rs.getString("fathers_occupation"));
                        ps.setMothers_occupation(rs.getString("mothers_occupation"));
                        ps.setMother_tongue(rs.getString("mother_tongue"));
                        ps.setCurrent_address_fk(rs.getInt("current_address_fk"));
                        ps.setPermanent_address_fk(rs.getInt("permanent_address_fk"));
                        return ps;
                    }

                });

        ps.setUsername(username);        
        return ps;
    }

}
