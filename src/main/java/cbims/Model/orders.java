package cbims.Model;

public class orders {
    private int order_ID;
    private int order_No;
    private String order_DateTime;
    private String customer_Name;
    private String book_ID;
    private Double orderDetails_Price;
    private int orderDetails_Quantity;
    private Double orderDetails_TotalPrice;

    public orders() {
        super();
    }

    public orders(int order_ID, int order_No, String order_DateTime, String customer_Name, String book_ID, Double orderDetails_Price, int orderDetails_Quantity, Double orderDetails_TotalPrice) {
        super();
        this.order_ID = order_ID;
        this.order_No = order_No;
        this.order_DateTime = order_DateTime;
        this.customer_Name = customer_Name;
        this.book_ID = book_ID;
        this.orderDetails_Price = orderDetails_Price;
        this.orderDetails_Quantity = orderDetails_Quantity;
        this.orderDetails_TotalPrice = orderDetails_TotalPrice;
    }

    public int getOrder_ID() {
        return order_ID;
    }

    public void setOrder_ID(int order_ID) {
        this.order_ID = order_ID;
    }

    public int getOrder_No() {
        return order_No;
    }

    public void setOrder_No(int order_No) {
        this.order_No = order_No;
    }

    public String getOrder_DateTime() {
        return order_DateTime;
    }

    public void setOrder_DateTime(String order_DateTime) {
        this.order_DateTime = order_DateTime;
    }

    public String getCustomer_Name() {
        return customer_Name;
    }

    public void setCustomer_Name(String customer_Name) {
        this.customer_Name = customer_Name;
    }

    public String getBook_ID() {
        return book_ID;
    }

    public void setBook_ID(String book_ID) {
        this.book_ID = book_ID;
    }

    public Double getOrderDetails_Price() {
        return orderDetails_Price;
    }

    public void setOrderDetails_Price(Double orderDetails_Price) {
        this.orderDetails_Price = orderDetails_Price;
    }

    public int getOrderDetails_Quantity() {
        return orderDetails_Quantity;
    }

    public void setOrderDetails_Quantity(int orderDetails_Quantity) {
        this.orderDetails_Quantity = orderDetails_Quantity;
    }

    public Double getOrderDetails_TotalPrice() {
        return orderDetails_TotalPrice;
    }

    public void setOrderDetails_TotalPrice(Double orderDetails_TotalPrice) {
        this.orderDetails_TotalPrice = orderDetails_TotalPrice;
    }
}
