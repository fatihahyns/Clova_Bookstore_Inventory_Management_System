<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 8/1/2022
  Time: 10:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>

<%
    String id = request.getParameter("book_ID");
    String dbDriver = "com.mysql.jdbc.Driver";
    String dbUname = "root";
    String dbPassword = "";
    String dbUrl = "jdbc:mysql://localhost:3306/cbims";
    try {
        Class.forName(dbDriver);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;
%>
<%
    try{
        connection = DriverManager.getConnection(dbUrl, dbUname, dbPassword);
        statement=connection.createStatement();
        String sql ="select * from book Inner join category on book.category_ID = category.category_ID where book.book_ID="+id;
        resultSet = statement.executeQuery(sql);
        while(resultSet.next()){
%>
<html>
<head>
    <title>Books | Bookstore Inventory Management System</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
    <style>
        table.table td a {
            cursor: pointer;
            display: inline-block;
            margin: 0 5px;
            min-width: 24px;
        }
        table.table td a.edit {
            color: #FFC107;
        }
        table.table td a.delete {
            color: #E34724;
        }

        .nav-tabs .nav-link.active {
            background-color: #F4F4F4;
        }
    </style>
</head>
<body class="is-preload">
<!-- Wrapper -->
<div id="wrapper">

    <!-- Header -->
    <header id="header">
        <div class="inner">

            <!-- Logo -->
            <a href="index.jsp" class="logo">
                <span class="fa fa-book"></span> <span class="title">Bookstore Inventory Management System</span>
            </a>

            <!-- Nav -->
            <nav>
                <ul>
                    <li><a href="#menu">CLOVA BOOKSTORE</a></li>
                </ul>
            </nav>

        </div>
    </header>

    <!-- Menu -->
    <nav id="menu">
        <h2>CLOVA BOOKSTORE</h2>
        <ul>
            <li><a href="index.jsp">Dashboard</a></li>

            <li><a href="books.jsp" class="active">Books</a></li>

            <li><a href="category.jsp">Category</a></li>

            <li><a href="suppliers.jsp">Suppliers</a></li>

            <li><a href="customers.jsp">Customers</a></li>

            <li><a href="orders.jsp">Orders</a></li>


            <li>
                <a href="#" class="dropdown-toggle">Account</a>

                <ul>
                    <li><a href="profile.jsp">Profile</a></li>
                    <li><a href="login.jsp">Log out</a></li>
                </ul>
            </li>

        </ul>
    </nav>

    <!-- Main -->
    <div id="main">
        <div class="inner">
            <h1>Books</h1>

            <!-- Tabs navs -->
            <ul class="nav nav-tabs mb-3">
                <li class="nav-item">
                    <a
                            class="nav-link active"
                            data-bs-toggle="tab"
                            href="#add-books"
                    >Update Books</a
                    >
                </li>
            </ul>
            <!-- Tabs navs -->

            <!-- Tabs content -->
            <div class="tab-content">
                <div
                        class="tab-pane fade show active"
                        id="add-books">

                    <div class="bkstr-form">
                        <form class="form-horizontal" method="post" action="updateBooks-process.jsp">
                            <div class="form-group">
                                <label class="control-label col-sm-4">Book Category:</label>
                                <div class="col-sm-12">
                                    <select class="form-control" name="category_ID">
                                        <sql:setDataSource var="ic" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/cbims" user="root" password=""/>
                                        <sql:query dataSource="${ic}" var="oc">
                                            SELECT * from category order by category_Name;
                                        </sql:query>
                                        <c:forEach var="result" items="${oc.rows}">
                                            <option value="${result.category_ID}">${result.category_Name}</option>
                                        </c:forEach>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-4">Book Title:</label>
                                <div class="col-sm-12">
                                    <input type="text" class="form-control" value="<%=resultSet.getString("book_Name") %>" name="book_Title">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-4">Author Name:</label>
                                <div class="col-sm-12">
                                    <input type="text" class="form-control"name="book_AuthorName" value="<%=resultSet.getString("book_AuthorName") %>">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-4">Book Description:</label>
                                <div class="col-sm-12">
                                    <textarea class="form-control"  value="<%=resultSet.getString("book_Description") %>" name="book_Description" rows="5"></textarea>
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="control-label col-sm-4">Price:</label>
                                <div class="col-sm-12">
                                    <input type="text" class="form-control" name="book_Price" value="<%=resultSet.getString("book_Price") %>">
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="control-label col-sm-4">No of Stocks:</label>
                                <div class="col-sm-12">
                                    <input type="text" class="form-control"  name="book_NoOfStocks" value="<%=resultSet.getString("book_NoOfStocks") %>">
                                </div>
                            </div>

                            <button type="submit" class="btn btn-primary btn-block mb-4" value="submit" >SUBMIT</button>

                        </form>
                        <%
                                }
                                connection.close();
                            } catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>
                    </div>
                </div>
            </div>
            <!-- Tabs content -->


        </div>
    </div>

    <!-- Footer -->
    <footer id="footer">
        <div class="inner">


            <ul class="copyright">
                <li>Copyright © 2021 CLOVA Bookstore </li>
                <li>Template by: <a href="https://www.phpjabbers.com/">PHPJabbers.com</a></li>
            </ul>
        </div>
    </footer>

</div>

<!-- Scripts -->
<script src="assets/js/jquery.min.js"></script>
<script src="assets/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/js/jquery.scrolly.min.js"></script>
<script src="assets/js/jquery.scrollex.min.js"></script>
<script src="assets/js/main.js"></script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW" crossorigin="anonymous"></script>

</body>
</html>
