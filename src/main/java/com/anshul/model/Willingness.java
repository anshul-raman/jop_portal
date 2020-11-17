package com.anshul.model;

public class Willingness {
    private int user_id;
    private int company_id;
    private int resume_id;
    private PersonalProfile user;
    private Company company;
    private Resume resume;

    public Willingness() {
        this.company = new Company();
        this.resume = new Resume();
        this.user = new PersonalProfile();
    }

    public PersonalProfile getUser() {
        return user;
    }

    public void setUser(PersonalProfile user) {
        this.user = user;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public int getCompany_id() {
        return company_id;
    }

    public void setCompany_id(int company_id) {
        this.company_id = company_id;
    }

    public int getResume_id() {
        return resume_id;
    }

    public void setResume_id(int resume_id) {
        this.resume_id = resume_id;
    }

    public Company getCompany() {
        return company;
    }

    public void setCompany(Company company) {
        this.company = company;
    }

    public Resume getResume() {
        return resume;
    }

    public void setResume(Resume resume) {
        this.resume = resume;
    }
}
