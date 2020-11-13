package com.anshul.model;

import java.util.List;

public class Resume {
    private int id;
    private int name;
    List<ResumeField> resumeFields;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getName() {
        return name;
    }

    public void setName(int name) {
        this.name = name;
    }

    public List<ResumeField> getResumeFields() {
        return resumeFields;
    }

    public void setResumeFields(List<ResumeField> resumeFields) {
        this.resumeFields = resumeFields;
    }

    @Override
    public String toString() {
        return "Resume [id=" + id + ", name=" + name + "]";
    }
}
