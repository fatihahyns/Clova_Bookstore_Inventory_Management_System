package com.example.clova_bookstore_inventory_management_system;

import java.sql.*;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.example.clova_bookstore_inventory_management_system.register;

public class registerDAO {
    private String dbUrl = "jdbc:mysql://localhost:3306/cbims";
    private String dbUname = "root";
    private String dbPassword = "";
    private String dbDriver = "com.mysql.cj.jdbc.Driver";

    static ResultSet rs = null;
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

    //register function
    public String register(register reg)
    {
        loadDriver(dbDriver);
        Connection con = getConnection();
        String result = "User successfully registered!";
        String sql = "insert into admin values(?,?,?,?,?,?)";

        PreparedStatement ps;
        try {
            ps = con.prepareStatement(sql);
            ps.setInt(1, reg.getAdmin_ID());
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

    //login function
    public boolean login(register log)
    {
        boolean status = false;

        loadDriver(dbDriver);
        Connection con = getConnection();

        String sql = "select * from admin where admin_Username = ? and admin_Password =?";
        PreparedStatement ps;
        try {
            ps = con.prepareStatement(sql);
            ps.setString(1, log.getAdmin_Username());
            ps.setString(2, log.getAdmin_Password());
            /*ps.setInt(3,log.getAdmin_ID());
            ps.setString(4,log.getAdmin_Name());
            ps.setString(5,log.getAdmin_PhoneNo());
            ps.setString(6, log.getAdmin_Email());*/
            ResultSet rs = ps.executeQuery();
            status = rs.next();

            int admin_ID = rs.getInt("admin_ID");
            String admin_Name = rs.getString("admin_Name");
            String admin_PhoneNo = rs.getString("admin_PhoneNo");
            String admin_Email = rs.getString("admin_Email");
            String admin_Username = rs.getString("admin_Username");
            String admin_Password = rs.getString("admin_Password");
            //System.out.println("Welcome " + admin_Name);
            log.setAdmin_ID(admin_ID);
            log.setAdmin_Name(admin_Name);
            log.setAdmin_PhoneNo(admin_PhoneNo);
            log.setAdmin_Email(admin_Email);
            log.setAdmin_Username(admin_Username);
            log.setAdmin_Password(admin_Password);

        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return status;
    }

    public void updateUser(register admin)
    {
        loadDriver(dbDriver);
        Connection con = getConnection();

        String UPDATE_USERS_SQL = "update admin set admin_Name = ?,admin_PhoneNo= ?, admin_Username =?,admin_Email =?,admin_Password =? where admin_ID = ?";
        try
        {

            PreparedStatement statement = con.prepareStatement(UPDATE_USERS_SQL);
            statement.setString(1, admin.getAdmin_Name());
            statement.setString(2, admin.getAdmin_PhoneNo());
            statement.setString(3, admin.getAdmin_Username());
            statement.setString(4, admin.getAdmin_Email());
            statement.setString(5, admin.getAdmin_Password());
            statement.setInt(6, admin.getAdmin_ID());
            statement.executeUpdate();

        }
        catch(SQLException e)
        {
            e.printStackTrace();
        }

    }

    public List<register> getAllUsers()
    {
        List<register> admins = new ArrayList<register>();
        try
        {
            loadDriver(dbDriver);
            Connection con = getConnection();
            Statement statement = con.createStatement();
            ResultSet rs = statement.executeQuery("select * from admin");
            while (rs.next()) {
                int admin_ID = rs.getInt("admin_ID");
                String admin_Name = rs.getString("admin_Name");
                String admin_PhoneNo = rs.getString("admin_PhoneNo");
                String admin_Email = rs.getString("admin_Email");
                String admin_Username = rs.getString("admin_Username");
                String admin_Password = rs.getString("admin_Password");
                register admin = new register(admin_ID,admin_Name,admin_PhoneNo,admin_Username,admin_Email,admin_Password);
                admins.add(admin);
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }

        return admins;
    }

    public register getUserById(int admin_ID)
    {
        loadDriver(dbDriver);
        Connection con = getConnection();
        register admin = null;
        try
        {
            PreparedStatement preparedStatement = con.
                    prepareStatement("select * from admin where admin_ID=?");
            preparedStatement.setInt(1, admin_ID);
            ResultSet rs = preparedStatement.executeQuery();

            if (rs.next()) {
                String adminName = rs.getString("admin_Name");
                String adminPhone = rs.getString("admin_PhoneNo");
                String adminEmail = rs.getString("admin_Email");
                String adminUsername = rs.getString("admin_Username");
                String adminPassword = rs.getString("admin_Password");
                admin = new register (admin_ID,adminName,adminPhone,adminEmail,adminUsername,adminPassword);
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }

        return admin;
    }

    /*private void printSQLException(SQLException ex)
    {
        for (Throwable e: ex)
        {
            if (e instanceof SQLException)
            {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null)
                {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }

    }*/
}