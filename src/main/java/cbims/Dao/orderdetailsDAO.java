package cbims.Dao;

import cbims.DBConnect.DBConnection;
import cbims.Model.orderdetails;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class orderdetailsDAO {
    public boolean addToCart(orderdetails od) {
        Connection con = DBConnection.getConn();


        String sql = "INSERT INTO orderdetails (orderDetails_ID, book_ID, orderDetails_Price, orderDetails_Quantity, orderDetails_TotalPrice) VALUES (NULL, ?, ?, 1, ?) ";

        int i = 0;

        try {
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, od.getBook_ID());
            ps.setDouble(2, od.getOrderDetails_Price());
            ps.setDouble(3, od.getOrderDetails_TotalPrice());


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
}
