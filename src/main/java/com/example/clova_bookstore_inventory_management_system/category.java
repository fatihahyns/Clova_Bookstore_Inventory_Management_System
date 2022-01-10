package com.example.clova_bookstore_inventory_management_system;

public class category {
    public String category_ID;
    public String category_Name;
    public String category_NoOfBooks;

    public category(String category_ID, String category_Name, String category_NoOfBooks) {
        this.category_ID = category_ID;
        this.category_Name = category_Name;
        this.category_NoOfBooks = category_NoOfBooks;
    }

    public String getCategory_ID() {
        return category_ID;
    }

    public void setCategory_ID(String category_ID) {
        this.category_ID = category_ID;
    }

    public String getCategory_Name() {
        return category_Name;
    }

    public void setCategory_Name(String category_Name) {
        this.category_Name = category_Name;
    }

    public String getCategory_NoOfBooks() {
        return category_NoOfBooks;
    }

    public void setCategory_NoOfBooks(String category_NoOfBooks) {
        this.category_NoOfBooks = category_NoOfBooks;
    }
}
