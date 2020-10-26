package com.anshul.model;

public class Result {

    private int id;
    private int result_type;
    private CriteriaType result_type_details;
    private int student;
    private int year;
    private int univ_id;
    private University university;
    private String specialisation;
    private float cgpa;
    private float marks;
    private float percentage;
    private int backlogs;
    private boolean is_verified;

    public Result() {

        this.setUniversity(new University());
    }

    public CriteriaType getResult_type_details() {
        return result_type_details;
    }

    public void setResult_type_details(CriteriaType result_type_details) {
        this.result_type_details = result_type_details;
    }

    public University getUniversity() {
        return university;
    }

    public void setUniversity(University university) {
        this.university = university;
    }

    public int getId() {
        return id;
    }

    public boolean getIs_verified() {
        return is_verified;
    }

    public void setIs_verified(boolean is_verified) {
        this.is_verified = is_verified;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getResult_type() {
        return result_type;
    }

    public void setResult_type(int result_type) {
        this.result_type = result_type;
    }

    public int getStudent() {
        return student;
    }

    public void setStudent(int student) {
        this.student = student;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public int getUniv_id() {
        return univ_id;
    }

    public void setUniv_id(int univ_id) {
        this.univ_id = univ_id;
    }

    public String getSpecialisation() {
        return specialisation;
    }

    public void setSpecialisation(String specialisation) {
        this.specialisation = specialisation;
    }

    public float getCgpa() {
        return cgpa;
    }

    public void setCgpa(float cgpa) {
        this.cgpa = cgpa;
    }

    public float getMarks() {
        return marks;
    }

    public void setMarks(float marks) {
        this.marks = marks;
    }

    public float getPercentage() {
        return percentage;
    }

    public void setPercentage(float percentage) {
        this.percentage = percentage;
    }

    public int getBacklogs() {
        return backlogs;
    }

    public void setBacklogs(int backlogs) {
        this.backlogs = backlogs;
    }

    @Override
    public String toString() {
        return "Result [backlogs=" + backlogs + ", cgpa=" + cgpa + ", id=" + id + ", is_verified=" + is_verified
                + ", marks=" + marks + ", percentage=" + percentage + ", result_type=" + result_type
                + ", specialisation=" + specialisation + ", student=" + student + ", univ_id=" + univ_id + ", year="
                + year + "]";
    }

    

}
