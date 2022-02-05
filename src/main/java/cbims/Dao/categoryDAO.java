package cbims.Dao;

import cbims.Model.category;
import cbims.DBConnect.DBConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class categoryDAO {
    public boolean addCategory(category cat) {
        Connection con = DBConnection.getConn();

        String sql = "INSERT INTO category (category_ID, category_Name, category_NoOfBooks) VALUES (NULL, ?, ?) ";

        int i = 0;

        try {
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, cat.getCategory_Name());
            ps.setString(2, cat.getCategory_NoOfBooks());

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

    public boolean updateCategory(category cat){
        Connection con = DBConnection.getConn();

        String sql = "UPDATE category SET category_Name=?, category_NoOfBooks=? WHERE category_ID=?";

        int i = 0;

        try {
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, cat.getCategory_Name());
            ps.setString(2, cat.getCategory_NoOfBooks());
            ps.setInt(3, cat.getCategory_ID());

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

    public category getCategoryByID(int id){
        Connection con = DBConnection.getConn();

        category cat = new category();

        String sql = "SELECT * FROM category WHERE category_ID=?";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                cat.setCategory_ID(rs.getInt("category_ID"));
                cat.setCategory_Name(rs.getString("category_Name"));
                cat.setCategory_NoOfBooks(rs.getString("category_NoOfBooks"));
            }

        }catch (SQLException e) {
            e.printStackTrace();
        }
        return cat;
    }

    public List<category> getAllCategory(){
        Connection con = DBConnection.getConn();

        List <category> list = new ArrayList<>();

        category cat = new category();

        String sql = "Select * from category";

        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                cat.setCategory_ID(rs.getInt("category_ID"));
                cat.setCategory_Name(rs.getString("category_Name"));
                cat.setCategory_NoOfBooks(rs.getString("category_NoOfBooks"));
                list.add(cat);
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return list;
    }


    public boolean deleteCategory(int id){
        Connection con = DBConnection.getConn();

        String sql = "DELETE FROM category WHERE category_ID=?";

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
