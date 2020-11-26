package com.anshul.model;

import java.util.Date;

import com.anshul.Auth.User;

import org.springframework.format.annotation.DateTimeFormat;

public class PersonalProfile {

    private int id;
    private String username;

    private String first_name;
    private String middle_name;
    private String last_name;
    private String email;

    private String fathers_name;
    private String mothers_name;
    private String fathers_occupation;
    private String mothers_occupation;
    private String mother_tongue;
    
    private int current_address_fk;
    private int permanent_address_fk;
    private Address current_address;
    private Address permanent_address;
    private User user;

    private @DateTimeFormat(pattern = "yyyy-MM-dd") Date dob;

    public PersonalProfile() {
        this.current_address = new Address();
        this.permanent_address = new Address();
        this.user = new User();
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getFirst_name() {
        return first_name;
    }

    public void setFirst_name(String first_name) {
        this.first_name = first_name;
    }

    public String getMiddle_name() {
        return middle_name;
    }

    public void setMiddle_name(String middle_name) {
        this.middle_name = middle_name;
    }

    public String getLast_name() {
        return last_name;
    }

    public void setLast_name(String last_name) {
        this.last_name = last_name;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFathers_name() {
        return fathers_name;
    }

    public void setFathers_name(String fathers_name) {
        this.fathers_name = fathers_name;
    }

    public String getMothers_name() {
        return mothers_name;
    }

    public void setMothers_name(String mothers_name) {
        this.mothers_name = mothers_name;
    }

    public String getFathers_occupation() {
        return fathers_occupation;
    }

    public void setFathers_occupation(String fathers_occupation) {
        this.fathers_occupation = fathers_occupation;
    }

    public String getMothers_occupation() {
        return mothers_occupation;
    }

    public void setMothers_occupation(String mothers_occupation) {
        this.mothers_occupation = mothers_occupation;
    }

    public String getMother_tongue() {
        return mother_tongue;
    }

    public void setMother_tongue(String mother_tongue) {
        this.mother_tongue = mother_tongue;
    }

    public int getCurrent_address_fk() {
        return current_address_fk;
    }

    public void setCurrent_address_fk(int current_address_fk) {
        this.current_address_fk = current_address_fk;
    }

    public int getPermanent_address_fk() {
        return permanent_address_fk;
    }

    public void setPermanent_address_fk(int permanent_address_fk) {
        this.permanent_address_fk = permanent_address_fk;
    }

    public Address getCurrent_address() {
        return current_address;
    }

    public void setCurrent_address(Address current_address) {
        this.current_address = current_address;
    }

    public Address getPermanent_address() {
        return permanent_address;
    }

    public void setPermanent_address(Address permanent_address) {
        this.permanent_address = permanent_address;
    }

    
    


}
