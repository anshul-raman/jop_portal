package com.anshul.model;

public class Address {
    private int id;
    private int pincode;
    private String house_no;
    private String locality;
    private String state;
    private String city;
    private String country;


    public int getPincode() {
        return pincode;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setPincode(int pincode) {
        this.pincode = pincode;
    }

    public String getHouse_no() {
        return house_no;
    }

    public void setHouse_no(String house_no) {
        this.house_no = house_no;
    }

    public String getLocality() {
        return locality;
    }

    public void setLocality(String locality) {
        this.locality = locality;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    @Override
    public String toString() {
        return "Address [city=" + city + ", country=" + country + ", house_no=" + house_no + ", id=" + id
                + ", locality=" + locality + ", pincode=" + pincode + ", state=" + state + "]";
    }

	public boolean isValid() {
		return this.pincode > 99999 && this.pincode <= 999999;
	}
}
