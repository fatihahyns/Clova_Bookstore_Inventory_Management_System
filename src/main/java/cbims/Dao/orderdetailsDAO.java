package cbims.Dao;

import cbims.DBConnect.DBConnection;
import cbims.Model.category;
import cbims.Model.orderdetails;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class orderdetailsDAO {
    public boolean addBookToCart(orderdetails od) {
        Connection con = DBConnection.getConn();


        String sql = "INSERT INTO orderdetails (orderDetails_ID, book_ID, customer_Name, orderDetails_Price, orderDetails_Quantity, orderDetails_TotalPrice) VALUES (NULL, ?, ?, ?, 1, ?) ";

        int i = 0;

        try {
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, od.getBook_ID());
            ps.setString(2, od.getCustomer_Name());
            ps.setDouble(3, od.getOrderDetails_Price());
            ps.setDouble(4, od.getOrderDetails_TotalPrice());


            i = ps.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
        }
        if (i == 0){
            return false;
        } else {
            return true;
        }
    }

    public Double getPriceByBookID(String id){
        Connection con = DBConnection.getConn();

        Double price = 0.0;

        orderdetails od = new orderdetails();

        String sql = "SELECT orderDetails_Price FROM orderdetails WHERE book_ID=?";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                price = rs.getDouble("orderDetails_Price");
            }

        }catch (SQLException e) {
            e.printStackTrace();
        }
        return price;
    }

    public boolean updateQuantity(orderdetails od){
        Connection con = DBConnection.getConn();


        String sql = "UPDATE orderdetails SET orderDetails_Quantity=?, orderDetails_TotalPrice=? WHERE book_ID=?";

        int i = 0;

        try {
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, od.getOrderDetails_Quantity());
            ps.setDouble(2, od.getOrderDetails_TotalPrice());
            ps.setString(3, od.getBook_ID());

            i = ps.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
        }
        if (i == 0){
            return false;
        } else {
            return true;
        }
    }

    public orderdetails getItemByBookID(String id){
        Connection con = DBConnection.getConn();

        orderdetails od = new orderdetails();



        String sql = "SELECT * FROM orderdetails WHERE book_ID=?";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                od.setOrderDetails_ID(rs.getInt("orderDetails_ID"));
                od.setBook_ID(rs.getString("book_ID"));
                od.setCustomer_Name(rs.getString("customer_Name"));
                od.setOrderDetails_Price(rs.getDouble("orderDetails_Price"));
                od.setOrderDetails_Quantity(rs.getInt("orderDetails_Quantity"));
                od.setOrderDetails_TotalPrice(rs.getDouble("orderDetails_TotalPrice"));
            }

        }catch (SQLException e) {
            e.printStackTrace();
        }
        return od;
    }

    public boolean removeBookFromCart(String id){
        Connection con = DBConnection.getConn();

        String sql = "DELETE FROM orderdetails WHERE book_ID=?";

        int i = 0;

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id);

            i = ps.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
        }
        if (i == 0){
            return false;
        } else {
            return true;
        }
    }
}
