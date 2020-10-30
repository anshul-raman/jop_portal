package com.anshul.model;

import java.util.List;

public class Criteria {

    private int id;
    private int type;
    private CriteriaType type_details;
    private int company_id;
    private int year_min;
    private int year_max;
    private float min_cgpa;

    private float min_marks;

    private float min_percentage;
    private int allowed_backlogs;

    private List<CriteriaSpecialisation> specialisatons;

    public int getId() {
        return id;
    }

    public int getAllowed_backlogs() {
        return allowed_backlogs;
    }

    public void setAllowed_backlogs(int allowed_backlogs) {
        this.allowed_backlogs = allowed_backlogs;
    }

    public CriteriaType getType_details() {
        return type_details;
    }

    public void setType_details(CriteriaType type_details) {
        this.type_details = type_details;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }

    public int getCompany_id() {
        return company_id;
    }

    public void setCompany_id(int company_id) {
        this.company_id = company_id;
    }

    public int getYear_min() {
        return year_min;
    }

    public void setYear_min(int year_min) {
        this.year_min = year_min;
    }

    public int getYear_max() {
        return year_max;
    }

    public void setYear_max(int year_max) {
        this.year_max = year_max;
    }

    public float getMin_cgpa() {
        return min_cgpa;
    }

    public void setMin_cgpa(float min_cgpa) {
        this.min_cgpa = min_cgpa;
    }

    public float getMin_marks() {
        return min_marks;
    }

    public void setMin_marks(float min_marks) {
        this.min_marks = min_marks;
    }

    public float getMin_percentage() {
        return min_percentage;
    }

    public void setMin_percentage(float min_percentage) {
        this.min_percentage = min_percentage;
    }

    public List<CriteriaSpecialisation> getSpecialisatons() {
        return specialisatons;
    }

    public void setSpecialisatons(List<CriteriaSpecialisation> specialisatons) {
        this.specialisatons = specialisatons;
    }

}
