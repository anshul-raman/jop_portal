package com.anshul.model;

import java.util.List;

public class Criteria {
    
    private int id;
    private int type;
    private int company_id;
    private int year_min;
    private int year_max;
    private float min_cgpa;
    private float max_cgpa;
    private float min_marks;
    private float max_marks;
    private float min_percentage;
    private float max_percentage;
    private List<String> specialisatons;

    public int getId() {
        return id;
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

    public float getMax_cgpa() {
        return max_cgpa;
    }

    public void setMax_cgpa(float max_cgpa) {
        this.max_cgpa = max_cgpa;
    }

    public float getMin_marks() {
        return min_marks;
    }

    public void setMin_marks(float min_marks) {
        this.min_marks = min_marks;
    }

    public float getMax_marks() {
        return max_marks;
    }

    public void setMax_marks(float max_marks) {
        this.max_marks = max_marks;
    }

    public float getMin_percentage() {
        return min_percentage;
    }

    public void setMin_percentage(float min_percentage) {
        this.min_percentage = min_percentage;
    }

    public float getMax_percentage() {
        return max_percentage;
    }

    public void setMax_percentage(float max_percentage) {
        this.max_percentage = max_percentage;
    }

    public List<String> getSpecialisatons() {
        return specialisatons;
    }

    public void setSpecialisatons(List<String> specialisatons) {
        this.specialisatons = specialisatons;
    }



}
