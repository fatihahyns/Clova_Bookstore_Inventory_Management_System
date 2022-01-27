package cbims.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import cbims.DBConnect.DBConnection;
import cbims.Model.suppliers;

public class suppliersDAO {

    public boolean addSupplier(suppliers sp) {
        Connection con = DBConnection.getConn();

        String sql = "INSERT INTO supplier (supplier_ID, supplier_Name, supplier_Address, supplier_Postcode, supplier_City, supplier_State, supplier_PhoneNo, supplier_Email) VALUES (null, ?, ?, ?, ?, ?, ?, ?) ";

        int i = 0;

        try {
            PreparedStatement ps = con.prepareStatement(sql);

//            ps.setString(1, sp.getSupplier_ID());
            ps.setString(1, sp.getSupplier_Name());
            ps.setString(2, sp.getSupplier_Address());
            ps.setString(3, sp.getSupplier_Postcode());
            ps.setString(4, sp.getSupplier_City());
            ps.setString(5, sp.getSupplier_State());
            ps.setString(6,sp.getSupplier_PhoneNo());
            ps.setString(7, sp.getSupplier_Email());

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
             ps.setString(8, sp.getSupplier_ID());

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

    public suppliers selectByID(String id)
    {
        Connection con = DBConnection.getConn();

        suppliers sp = null;

        String sql = "SELECT * FROM supplier WHERE supplier_ID=?";
        try
        {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                String supplier_Name = rs.getString("supplier_Name");
                String supplier_Address = rs.getString("supplier_Address");
                String supplier_Postcode = rs.getString("supplier_Postcode");
                String supplier_City = rs.getString("supplier_City");
                String supplier_State = rs.getString("supplier_State");
                String supplier_PhoneNo = rs.getString("supplier_PhoneNo");
                String supplier_Email = rs.getString("supplier_Email");
                sp = new suppliers(id, supplier_Name, supplier_Address, supplier_Postcode, supplier_City, supplier_State, supplier_PhoneNo, supplier_Email);
            }
        }
        catch (SQLException e) {
            e.printStackTrace();
        }

        return sp;
    }

    public suppliers getSupplierByID(String id){
        Connection con = DBConnection.getConn();

        suppliers sp = new suppliers();

        String sql = "SELECT * FROM supplier WHERE supplier_ID=?";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                sp.setSupplier_ID(rs.getString("supplier_ID"));
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

    public void deleteSupplier (String supplier_ID){
        Connection con = DBConnection.getConn();

        String sql = "DELETE FROM supplier WHERE supplier_ID=?";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            con.prepareStatement(sql);
            ps.setString(1, supplier_ID);
            ps.executeUpdate();
        } catch (SQLException e){
            e.printStackTrace();
        }
    }
}
