package com.anshul.model;

import java.util.List;
import java.util.HashSet;

public class Resume {
    private int id;
    private int user_id;
    private String name;
    private HashSet<Integer> resumeFieldIds;
    private List<ResumeField> resumeFields;

    public int getId() {
        return id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public HashSet<Integer> getResumeFieldIds() {
        return resumeFieldIds;
    }

    public void setResumeFieldIds(HashSet<Integer> resumeFieldIds) {
        this.resumeFieldIds = resumeFieldIds;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
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
