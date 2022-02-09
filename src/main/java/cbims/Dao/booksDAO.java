package cbims.Dao;

import cbims.Model.books;
import cbims.DBConnect.DBConnection;
import cbims.Model.category;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class booksDAO {
    public boolean addBook(books bk) {
        Connection con = DBConnection.getConn();

        String sql = "INSERT INTO book (book_ID, category_ID, supplier_ID, book_Title, book_AuthorName, book_Description, book_Price, book_NoOfStocks) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?) ";

        int i = 0;

        try {
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, bk.getCategory_ID());
            ps.setString(2, bk.getSupplier_ID());
            ps.setString(3, bk.getBook_Title());
            ps.setString(4, bk.getBook_AuthorName());
            ps.setString(5, bk.getBook_Description());
            ps.setString(6, bk.getBook_Price());
            ps.setString(7, bk.getBook_NoOfStocks());

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

    public boolean updateBook(books bk){
        Connection con = DBConnection.getConn();

        String sql = "UPDATE book SET category_ID=?, supplier_ID=?, book_Title=?, book_AuthorName=?, book_Description=?, book_Price=?, book_NoOfStocks=? WHERE book_ID=?";

        int i = 0;

        try {
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setString(1, bk.getCategory_ID());
            ps.setString(2, bk.getSupplier_ID());
            ps.setString(3, bk.getBook_Title());
            ps.setString(4, bk.getBook_AuthorName());
            ps.setString(5, bk.getBook_Description());
            ps.setString(6, bk.getBook_Price());
            ps.setString(7, bk.getBook_NoOfStocks());
            ps.setInt(8, bk.getBook_ID());

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

    public int getCurrentStock(String id){
        Connection con = DBConnection.getConn();

        int stock = 0;

        books bk = new books();

        String sql = "SELECT book_NoOfStocks FROM book WHERE book_ID=?";
        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                stock = rs.getInt("book_NoOfStocks");
            }

        }catch (SQLException e) {
            e.printStackTrace();
        }
        return stock;
    }

    public books getBookByID(int id){
        Connection con = DBConnection.getConn();

        books bk = new books();

        String sql = "SELECT * FROM book WHERE book_ID=?";

        try {
            PreparedStatement ps = con.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                bk.setBook_ID(rs.getInt("book_ID"));
                bk.setCategory_ID(rs.getString("category_ID"));
                bk.setSupplier_ID(rs.getString("supplier_ID"));
                bk.setBook_AuthorName(rs.getString("book_AuthorName"));
                bk.setBook_Title(rs.getString("book_Title"));
                bk.setBook_Description(rs.getString("book_Description"));
                bk.setBook_Price(rs.getString("book_Price"));
                bk.setBook_NoOfStocks(rs.getString("book_NoOfStocks"));
            }

        }catch (SQLException e) {
            e.printStackTrace();
        }
        return bk;
    }

    public List<books> getBookByCategoryID (int id){
        Connection con = DBConnection.getConn();

        List <books> list = new ArrayList<>();

        books bk = new books();

        String sql = "Select book_ID, category_ID, book_Title from book where category_ID=?";

        try{
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                bk.setBook_ID(rs.getInt("book_ID"));
                bk.setCategory_ID(rs.getString("category_ID"));
                bk.setBook_Title(rs.getString("book_Title"));
                list.add(bk);
            }
        } catch (SQLException e){
            e.printStackTrace();
        }
        return list;
    }

    public boolean deleteBook (int id){
        Connection con = DBConnection.getConn();

        String sql = "DELETE FROM book WHERE book_ID=?";

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
