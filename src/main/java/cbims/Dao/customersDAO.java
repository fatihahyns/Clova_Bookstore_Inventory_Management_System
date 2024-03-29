package cbims.Dao;

import cbims.Model.customers;
import cbims.DBConnect.DBConnection;

import java.sql.*;


public class customersDAO {
    public boolean addCustomer (customers cust){
        Connection con = DBConnection.getConn();

        String sql = "INSERT INTO customer (customer_ID, customer_Name, customer_PhoneNo, customer_Email) VALUES (NULL, ?,?,?) ";

        int i = 0;

        try {
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, cust.getCustomer_Name());
            ps.setString(2, cust.getCustomer_PhoneNo());
            ps.setString(3, cust.getCustomer_Email());

            i = ps.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }
        if (i == 0){
            return false;
        } else {
            return true;
        }
    }

    public boolean sessionCustomer (customers cust){
        boolean status = false;

        Connection con = DBConnection.getConn();

        String sql = "SELECT * FROM customer WHERE customer_Name=? AND customer_Email=?";

        try {
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, cust.getCustomer_Name());
            ps.setString(2, cust.getCustomer_Email());

            ResultSet rs = ps.executeQuery();
            status = rs.next();

                cust.setCustomer_ID(rs.getInt("customer_ID"));
                cust.setCustomer_PhoneNo(rs.getString("customer_PhoneNo"));
                cust.setCustomer_Name(rs.getString("customer_Name"));
                cust.setCustomer_Email(rs.getString("customer_Email"));
        }catch (SQLException e){
            e.printStackTrace();
        }
       return status;
    }
}
