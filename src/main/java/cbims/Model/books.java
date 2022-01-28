package cbims.Model;

public class books {

    private int book_ID;
    private String category_ID;
    private String book_Title;
    private String book_AuthorName;
    private String book_Description;
    private String book_Price;
    private String book_NoOfStocks;
    private String supplier_ID;

    public books() {
        super();
    }

    public books(int book_ID, String category_ID, String book_Title, String book_AuthorName, String book_Description, String book_Price, String book_NoOfStocks, String supplier_ID) {
        super();
        this.book_ID = book_ID;
        this.category_ID = category_ID;
        this.book_Title = book_Title;
        this.book_AuthorName = book_AuthorName;
        this.book_Description = book_Description;
        this.book_Price = book_Price;
        this.book_NoOfStocks = book_NoOfStocks;
        this.supplier_ID = supplier_ID;
    }

    public int getBook_ID() {
        return book_ID;
    }

    public void setBook_ID(int book_ID) {
        this.book_ID = book_ID;
    }

    public String getCategory_ID() {
        return category_ID;
    }

    public void setCategory_ID(String category_ID) {
        this.category_ID = category_ID;
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

    public String getSupplier_ID() {
        return supplier_ID;
    }

    public void setSupplier_ID(String supplier_ID) {
        this.supplier_ID = supplier_ID;
    }
}
