package cbims.Dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import cbims.DBConnect.DBConnection;
import cbims.Model.register;

public class registerDAO {

    //register function
    public String register(register reg)
    {
        Connection con = DBConnection.getConn();
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

        Connection con = DBConnection.getConn();

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
        Connection con = DBConnection.getConn();

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
            Connection con = DBConnection.getConn();
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
        Connection con = DBConnection.getConn();
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

}