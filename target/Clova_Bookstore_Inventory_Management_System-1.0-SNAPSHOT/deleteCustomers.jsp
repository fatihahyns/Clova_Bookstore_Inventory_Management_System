<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 12/1/2022
  Time: 10:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@page import="java.sql.*"%>

<%
    String id=request.getParameter("id");
    try
    {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/cbims", "root", "");
        Statement st=con.createStatement();
        int i=st.executeUpdate("DELETE FROM customer WHERE customer_ID="+id);
        out.println("Data Deleted Successfully!");

    }
    catch(Exception e)
    {
        System.out.print(e);
        e.printStackTrace();
        out.println("Delete Unsuccessful!");
    }
%>
