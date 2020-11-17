package com.anshul.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import com.anshul.model.Address;

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
public class AddressRepository {

    @Autowired
    NamedParameterJdbcTemplate namedTemplate;

    @Autowired
    JdbcTemplate template;

    public int createNew() {
        KeyHolder holder = new GeneratedKeyHolder();
        String query = "INSERT INTO addresses DEFAULT VALUES";
        namedTemplate.update(query, new MapSqlParameterSource(), holder, new String[] { "id" });
        return (int) holder.getKey();
    }

    public void update(Address address) {
        // System.out.println("repo" + address);
        String query = "update  addresses set " + "pincode = :pincode, " + "house_no = :house_no, "
                + "locality = :locality, " + "state = :state, " + "city = :city, " + "country = :country "
                + "where id = :id";

        SqlParameterSource parameters = new MapSqlParameterSource().addValue("pincode", address.getPincode())
                .addValue("house_no", address.getHouse_no()).addValue("locality", address.getLocality())
                .addValue("state", address.getState()).addValue("city", address.getCity())
                .addValue("country", address.getCountry()).addValue("id", address.getId());

        namedTemplate.update(query, parameters);
    }

    public Address getFromId(int id) {
        String query = "select * from addresses where id = ?";

        return  template.queryForObject(query, new Object[] { id }, new RowMapper<Address>() {

            @Override
            public Address mapRow(ResultSet rs, int rowNum) throws SQLException {
                Address ad = new Address();
                ad.setId(rs.getInt("id"));
                ad.setPincode(rs.getInt("pincode"));
                ad.setHouse_no(rs.getString("house_no"));
                ad.setLocality(rs.getString("locality"));
                ad.setState(rs.getString("state"));
                ad.setCity(rs.getString("city"));
                ad.setCountry(rs.getString("country"));

                return ad;
            }

        });
    }

}
