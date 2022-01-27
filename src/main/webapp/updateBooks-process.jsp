<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/cbims";%>
<%!String user = "root";%>
<%!String psw = "";%>
<%
    String book_ID = request.getParameter("book_ID");
    String category_ID = request.getParameter("category_ID");
    String book_Title = request.getParameter("book_Title");
    String book_AuthorName = request.getParameter("book_AuthorName");
    String book_Description = request.getParameter("book_Description");
    String book_Price = request.getParameter("book_Price");
    String book_NoOfStocks= request.getParameter("book_NoOfStocks");
    if(book_ID != null)
    {
        Connection con = null;
        PreparedStatement ps = null;
        int bookID = Integer.parseInt(book_ID);
        try
        {
            Class.forName(driverName);
            con = DriverManager.getConnection(url,user,psw);
            String sql="Update book set book_ID=?, category_ID=?, book_Title=?,book_AutthorName=?,book_Description=?,book_Price=?, book_NoOfStocks=? where book_ID="+book_ID;
            ps = con.prepareStatement(sql);

            ps.setString(1, book_ID);
            ps.setString(2, category_ID);
            ps.setString(3, book_Title);
            ps.setString(4, book_AuthorName);
            ps.setString(5, book_Description);
            ps.setString(6, book_Price);
            ps.setString(7, book_NoOfStocks);

            int i = ps.executeUpdate();
            if(i > 0)
            {
                out.print("Record Updated Successfully");
            }
            else
            {
                out.print("There is a problem in updating Record.");
            }
        }
        catch(SQLException sql)
        {
            request.setAttribute("error", sql);
            out.println(sql);
        }
    }
%>