package cbims.Model;

public class orderdetails {
    private int orderDetails_ID;
    private String book_ID;
    private double orderDetails_Price;
    private int orderDetails_Quantity;
    private  double orderDetails_TotalPrice;

    public orderdetails() {
        super();
    }

    public orderdetails(int orderDetails_ID,String book_ID, double orderDetails_Price, int orderDetails_Quantity, double orderDetails_TotalPrice) {
        super();
        this.orderDetails_ID = orderDetails_ID;
        this.book_ID = book_ID;
        this.orderDetails_Price = orderDetails_Price;
        this.orderDetails_Quantity = orderDetails_Quantity;
        this.orderDetails_TotalPrice = orderDetails_TotalPrice;
    }

    public int getOrderDetails_ID() {
        return orderDetails_ID;
    }

    public void setOrderDetails_ID(int orderDetails_ID) {
        this.orderDetails_ID = orderDetails_ID;
    }

    public String getBook_ID() {
        return book_ID;
    }

    public void setBook_ID(String book_ID) {
        this.book_ID = book_ID;
    }

    public double getOrderDetails_Price() {
        return orderDetails_Price;
    }

    public void setOrderDetails_Price(double orderDetails_Price) {
        this.orderDetails_Price = orderDetails_Price;
    }

    public int getOrderDetails_Quantity() {
        return orderDetails_Quantity;
    }

    public void setOrderDetails_Quantity(int orderDetails_Quantity) {
        this.orderDetails_Quantity = orderDetails_Quantity;
    }

    public double getOrderDetails_TotalPrice() {
        return orderDetails_TotalPrice;
    }

    public void setOrderDetails_TotalPrice(double orderDetails_TotalPrice) {
        this.orderDetails_TotalPrice = orderDetails_TotalPrice;
    }
}
