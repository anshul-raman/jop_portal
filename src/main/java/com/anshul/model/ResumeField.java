package com.anshul.model;

public class ResumeField {
    private int id;
    private int user_id;
    private boolean verified;
    private int verified_by;
    private String title;
    private String description;
    private String duration;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public boolean isVerified() {
        return verified;
    }

    public void setVerified(boolean verified) {
        this.verified = verified;
    }

    public int getVerified_by() {
        return verified_by;
    }

    public void setVerified_by(int verified_by) {
        this.verified_by = verified_by;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    @Override
    public String toString() {
        return "ResumeField [description=" + description + ", duration=" + duration + ", id=" + id + ", title=" + title
                + ", user_id=" + user_id + ", verified=" + verified + ", verified_by=" + verified_by + "]";
    }
    
}
