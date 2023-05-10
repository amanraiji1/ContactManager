package com.entities;

public class Contact {
    private String cName;
    private String cPhone;
    private String cEmail;
    private int userId;

    public Contact(String cName, String cPhone, String cEmail, int userId) {
        this.cName = cName;
        this.cPhone = cPhone;
        this.cEmail = cEmail;
        this.userId = userId;
    }
    
    public String getcName() {
        return cName;
    }

    public void setcName(String cName) {
        this.cName = cName;
    }

    public String getcPhone() {
        return cPhone;
    }

    public void setcPhone(String cPhone) {
        this.cPhone = cPhone;
    }

    public String getcEmail() {
        return cEmail;
    }

    public void setcEmail(String cEmail) {
        this.cEmail = cEmail;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }
    
    
    
}
