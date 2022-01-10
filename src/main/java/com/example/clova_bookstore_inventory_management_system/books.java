package com.example.clova_bookstore_inventory_management_system;

public class books {

    private String book_ID;
    private String book_Title;
    private String book_AuthorName;
    private String book_Description;
    private String book_Price;
    private String book_NoOfStocks;

    public books(String book_ID, String book_Title, String book_AuthorName, String book_Description, String book_Price, String book_NoOfStocks) {
        this.book_ID = book_ID;
        this.book_Title = book_Title;
        this.book_AuthorName = book_AuthorName;
        this.book_Description = book_Description;
        this.book_Price = book_Price;
        this.book_NoOfStocks = book_NoOfStocks;
    }

    public String getBook_ID() {
        return book_ID;
    }

    public void setBook_ID(String book_ID) {
        this.book_ID = book_ID;
    }

    public String getBook_Title() {
        return book_Title;
    }

    public void setBook_Title(String book_Title) {
        this.book_Title = book_Title;
    }

    public String getBook_AuthorName() {
        return book_AuthorName;
    }

    public void setBook_AuthorName(String book_AuthorName) {
        this.book_AuthorName = book_AuthorName;
    }

    public String getBook_Description() {
        return book_Description;
    }

    public void setBook_Description(String book_Description) {
        this.book_Description = book_Description;
    }

    public String getBook_Price() {
        return book_Price;
    }

    public void setBook_Price(String book_Price) {
        this.book_Price = book_Price;
    }

    public String getBook_NoOfStocks() {
        return book_NoOfStocks;
    }

    public void setBook_NoOfStocks(String book_NoOfStocks) {
        this.book_NoOfStocks = book_NoOfStocks;
    }
}
