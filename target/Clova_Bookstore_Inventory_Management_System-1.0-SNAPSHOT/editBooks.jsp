<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 27/1/2022
  Time: 2:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="cbims.DBConnect.DBConnection"%>
<%@ page import="cbims.Dao.booksDAO" %>
<%@ page import="cbims.Model.books" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<html>
<head>
    <title>Books | Bookstore Inventory Management System</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
</head>
<body>
<%
    String admin_Name = (String) session.getAttribute("admin_Name");
    if (admin_Name == null)
    { response.sendRedirect("login.jsp")
    ;}
%>

<% books bk = new books();%>
<% booksDAO bkdao = new booksDAO();%>

<form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/booksServlet">

    <input type="hidden" name="Action" value="Update Book" /> <%
    String bid = request.getParameter("id");
    if (!((bid) == null)) {
        int book_ID = Integer.parseInt(bid);
        bk = bkdao.getBookByID(book_ID);
%>

    <input type="hidden" name="id" value="<%=bk.getBook_ID()%>" />

    <div class="form-group">
        <label class="control-label col-sm-4">Book Category:</label>
        <div class="col-sm-12">
            <select class="form-control" name="category_ID" value="<%=bk.getCategory_ID()%>">
                <%
                    Connection con = DBConnection.getConn();
                    Statement st = con.createStatement();
                    ResultSet rs = st.executeQuery("SELECT * FROM category order by category_Name");
                    while (rs.next()){
                %>
                <option value="<%=rs.getInt("category_ID") %>"><%=rs.getString("category_Name") %></option>
                <%
                    }
                %>
            </select>
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-4">Book Title:</label>
        <div class="col-sm-12">
            <input type="text" class="form-control" name="book_Title" value="<%=bk.getBook_Title()%>">
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-4">Author Name:</label>
        <div class="col-sm-12">
            <input type="text" class="form-control"name="book_AuthorName" value="<%=bk.getBook_AuthorName()%>">
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-4">Book Description:</label>
        <div class="col-sm-12">
            <textarea class="form-control"  name="book_Description" value="<%=bk.getBook_Description()%>" rows="5"></textarea>
        </div>
    </div>


    <div class="form-group">
        <label class="control-label col-sm-4">Price:</label>
        <div class="col-sm-12">
            <input type="text" class="form-control" name="book_Price" value="<%=bk.getBook_Price()%>">
        </div>
    </div>


    <div class="form-group">
        <label class="control-label col-sm-4">No of Stocks:</label>
        <div class="col-sm-12">
            <input type="text" class="form-control"  name="book_NoOfStocks" value="<%=bk.getBook_NoOfStocks()%>">
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-4">Supplier:</label>
        <div class="col-sm-12">
            <select class="form-control" name="supplier_ID" value="<%=bk.getSupplier_ID()%>">
                <%
                    Statement st2 = con.createStatement();
                    ResultSet rs2 = st2.executeQuery("SELECT * FROM supplier order by supplier_Name");
                    while (rs2.next()){
                %>
                <option value="<%=rs2.getInt("supplier_ID") %>"><%=rs2.getString("supplier_Name") %></option>
                <%
                    }
                %>
            </select>
        </div>
    </div>

    <button type="submit" class="btn btn-primary btn-block mb-4" value="upd" >UPDATE</button>
    <%
        } else
            out.println("ID Not Found");
    %>
</form>

</body>
</html>