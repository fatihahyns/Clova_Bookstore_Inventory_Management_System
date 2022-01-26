package cbims.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
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

        String sql = "UPDATE supplier SET supplier_Name=?, supplier_Address=?, supplier_Postcode=?, supplier_City=?, supplier_State=?, supplier_PhoneNo=?, supplier_Email=?";
        sql += " WHERE supplier_ID=?";

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
