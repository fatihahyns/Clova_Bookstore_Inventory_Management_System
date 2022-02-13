package cbims.Dao;

import cbims.DBConnect.DBConnection;
import cbims.Model.orders;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ordersDAO {

    public boolean placeOrder(String custname){
        Connection con = DBConnection.getConn();

        int order_no = 1000, i = 0;


        try {
            PreparedStatement ps = con.prepareStatement("SELECT MAX(order_No)from orders");
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                order_no = rs.getInt(1);
                order_no = 1000 + order_no;
            }

            PreparedStatement ps1 = con.prepareStatement("SELECT bk.book_Title, bk.book_ISBN, od.orderDetails_Quantity, od.orderDetails_Price, od.orderDetails_TotalPrice," +
                    "od.book_ID from book bk,orderdetails od where bk.book_ID = od.book_ID AND od.customer_Name=?");
            ps1.setString(1, custname);
            ResultSet rs1 = ps1.executeQuery();

            while (rs1.next()) {
                order_no++;
                String bID = rs1.getString("book_ID");
                String bTitle = rs1.getString("book_Title");
                String bISBN = rs1.getString("book_ISBN");
                int odQuantity = rs1.getInt("orderDetails_Quantity");
                double odPrice = rs1.getDouble("orderDetails_Price");
                double odTPrice = rs1.getDouble("orderDetails_TotalPrice");

                PreparedStatement ps3 = con.prepareStatement("SELECT book_NoOfStocks from book where book_ID ='"+bID+"'");
                ResultSet rs3 = ps3.executeQuery();

                while (rs3.next()) {
                    int currentstock = rs3.getInt("book_NoOfStocks");
                    System.out.println(currentstock);
                    int newstock = currentstock - odQuantity;
                    System.out.println(newstock);
                    ps3 = con.prepareStatement("UPDATE book SET book_NoOfStocks='" + newstock + "' where book_ID='" + bID+ "' ");
                    ps3.executeUpdate();
                }

                i = con.createStatement().executeUpdate("INSERT INTO orders (order_ID, order_No, customer_Name, book_ID, orderDetails_Price, " +
                        "orderDetails_Quantity, orderDetails_TotalPrice) VALUES (NULL,'" + order_no + "','" + custname + "','" + bID + "','"+odPrice+"', '"+odQuantity+"', '"+odTPrice+"')");

            }
        }catch (SQLException e) {
            e.printStackTrace();
        }

        if (i == 0){
            return false;
        } else {
            return true;
        }
    }


    public orders getOrderByOrderNo(int id){
        Connection con = DBConnection.getConn();

        orders o = new orders();

        String sql = "SELECT bk.book_ID, bk.book_Title, bk.book_ISBN, od.* from book bk,orders od where bk.book_ID = od.book_ID AND od.order_No=?";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                o.setOrder_ID(rs.getInt("order_ID"));
                o.setOrder_No(rs.getInt("order_No"));
                o.setOrder_DateTime(rs.getString("order_DateTime"));
                o.setCustomer_Name(rs.getString("customer_Name"));
                o.setBook_ID(rs.getString("book_ID"));
                o.setBook_Title(rs.getString("book_Title"));
                o.setBook_ISBN(rs.getString("book_ISBN"));
                o.setOrderDetails_Price(rs.getDouble("orderDetails_Price"));
                o.setOrderDetails_Quantity(rs.getInt("orderDetails_Quantity"));
                o.setOrderDetails_TotalPrice(rs.getDouble("orderDetails_TotalPrice"));

            }

        }catch (SQLException e) {
            e.printStackTrace();
        }
        return o;
    }

}
