package cbims.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import cbims.DBConnect.DBConnection;
import cbims.Model.suppliers;

public class suppliersDAO {

    public boolean addSupplier(suppliers sp) {
        Connection con = DBConnection.getConn();

        String sql = "INSERT INTO supplier (supplier_ID, supplier_Name, supplier_Address, supplier_Postcode, supplier_City, supplier_State, supplier_PhoneNo, supplier_Email, admin_Name) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?)";

        int i = 0;

        try {
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, sp.getSupplier_Name());
            ps.setString(2, sp.getSupplier_Address());
            ps.setString(3, sp.getSupplier_Postcode());
            ps.setString(4, sp.getSupplier_City());
            ps.setString(5, sp.getSupplier_State());
            ps.setString(6,sp.getSupplier_PhoneNo());
            ps.setString(7, sp.getSupplier_Email());
            ps.setString(8, sp.getAdmin_Name());

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

    public boolean updateSupplier(suppliers sp){
        Connection con = DBConnection.getConn();

        String sql = "UPDATE supplier SET supplier_Name=?, supplier_Address=?, supplier_Postcode=?, supplier_City=?, supplier_State=?, supplier_PhoneNo=?, supplier_Email=? WHERE supplier_ID=?";

        int i = 0;

         try {
             PreparedStatement ps = con.prepareStatement(sql);

             ps.setString(1, sp.getSupplier_Name());
             ps.setString(2, sp.getSupplier_Address());
             ps.setString(3, sp.getSupplier_Postcode());
             ps.setString(4, sp.getSupplier_City());
             ps.setString(5, sp.getSupplier_State());
             ps.setString(6,sp.getSupplier_PhoneNo());
             ps.setString(7, sp.getSupplier_Email());
             ps.setInt(8, sp.getSupplier_ID());

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

    public suppliers getSupplierByID(int id){
        Connection con = DBConnection.getConn();

        suppliers sp = new suppliers();

        String sql = "SELECT * FROM supplier WHERE supplier_ID=?";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                sp.setSupplier_ID(rs.getInt("supplier_ID"));
                sp.setSupplier_Name(rs.getString("supplier_Name"));
                sp.setSupplier_Address(rs.getString("supplier_Address"));
                sp.setSupplier_Postcode(rs.getString("supplier_Postcode"));
                sp.setSupplier_City(rs.getString("supplier_City"));
                sp.setSupplier_State(rs.getString("supplier_State"));
                sp.setSupplier_PhoneNo(rs.getString("supplier_PhoneNo"));
                sp.setSupplier_Email(rs.getString("supplier_Email"));
            }

        }catch (SQLException e) {
            e.printStackTrace();
        }
        return sp;
    }

    public List getAllSuppliers() {
        List splist = new ArrayList();

        Connection con = DBConnection.getConn();

        String sql = "SELECT * FROM supplier";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                suppliers sp = new suppliers();
                sp.setSupplier_ID(rs.getInt("supplier_ID"));
                sp.setSupplier_Name(rs.getString("supplier_Name"));
                sp.setSupplier_Address(rs.getString("supplier_Address"));
                sp.setSupplier_Postcode(rs.getString("supplier_Postcode"));
                sp.setSupplier_City(rs.getString("supplier_City"));
                sp.setSupplier_State(rs.getString("supplier_State"));
                sp.setSupplier_PhoneNo(rs.getString("supplier_PhoneNo"));
                sp.setSupplier_Email(rs.getString("supplier_Email"));
                splist.add(sp);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return splist;
    }


    public boolean deleteSupplier (int id){
        Connection con = DBConnection.getConn();

        String sql = "DELETE FROM supplier WHERE supplier_ID=?";

        int i = 0;

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);

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
