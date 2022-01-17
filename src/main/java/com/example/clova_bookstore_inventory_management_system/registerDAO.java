package com.example.clova_bookstore_inventory_management_system;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class registerDAO {
    private String dbUrl = "jdbc:mysql://localhost:3306/cbims";
    private String dbUname = "root";
    private String dbPassword = "";
    private String dbDriver = "com.mysql.cj.jdbc.Driver";

    public void loadDriver(String dbDriver)
    {
        try {
            Class.forName(dbDriver);
        } catch (ClassNotFoundException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

    public Connection getConnection()
    {
        Connection con = null;
        try {
            con = DriverManager.getConnection(dbUrl, dbUname, dbPassword);
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return con;
    }

    public String register(register reg)
    {
        loadDriver(dbDriver);
        Connection con = getConnection();
        String result = "User successfully registered!";
        String sql = "insert into admin values(?,?,?,?,?,?)";

        PreparedStatement ps;
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, reg.getAdmin_ID());
            ps.setString(2, reg.getAdmin_Name());
            ps.setString(3, reg.getAdmin_PhoneNo());
            ps.setString(4, reg.getAdmin_Username());
            ps.setString(5, reg.getAdmin_Email());
            ps.setString(6, reg.getAdmin_Password());
            ps.executeUpdate();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
            result = "User not registered!";
        }
        return result;
    }
}