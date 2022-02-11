package cbims.Model;

public class category {
    public int category_ID;
    public String category_Name;

    public category() {
        super();
    }

    public category(int category_ID, String category_Name) {
        super();
        this.category_ID = category_ID;
        this.category_Name = category_Name;
    }

    public int getCategory_ID() {
        return category_ID;
    }

    public void setCategory_ID(int category_ID) {
        this.category_ID = category_ID;
    }

    public String getCategory_Name() {
        return category_Name;
    }

    public void setCategory_Name(String category_Name) {
        this.category_Name = category_Name;
    }

}
