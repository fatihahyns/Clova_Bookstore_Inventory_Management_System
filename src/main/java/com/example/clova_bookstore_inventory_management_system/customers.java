package com.example.clova_bookstore_inventory_management_system;

public class customers {
    private String customer_ID;
    private String customer_Name;
    private String customer_PhoneNo;
    private String customer_Email;

    public customers(String customer_ID, String customer_Name, String customer_PhoneNo, String customer_Email) {
        this.customer_ID = customer_ID;
        this.customer_Name = customer_Name;
        this.customer_PhoneNo = customer_PhoneNo;
        this.customer_Email = customer_Email;
    }

    public String getCustomer_ID() {
        return customer_ID;
    }

    public void setCustomer_ID(String customer_ID) {
        this.customer_ID = customer_ID;
    }

    public String getCustomer_Name() {
        return customer_Name;
    }

    public void setCustomer_Name(String customer_Name) {
        this.customer_Name = customer_Name;
    }

    public String getCustomer_PhoneNo() {
        return customer_PhoneNo;
    }

    public void setCustomer_PhoneNo(String customer_PhoneNo) {
        this.customer_PhoneNo = customer_PhoneNo;
    }

    public String getCustomer_Email() {
        return customer_Email;
    }

    public void setCustomer_Email(String customer_Email) {
        this.customer_Email = customer_Email;
    }
}
