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
    String dbDriver = "com.mysql.jdbc.Driver";
    String dbUname = "root";
    String dbPassword = "";
    String dbUrl = "jdbc:mysql://localhost:3306/cbims";

    try {
        Class.forName(dbDriver);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    }
    Connection con = null;
    Statement statement = null;
    ResultSet resultSet = null;
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
                    >Add Books</a
                    >
                </li>
                <li class="nav-item">
                    <a
                            class="nav-link"
                            data-bs-toggle="tab"
                            href="#list-books"
                    >List of Books</a
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
                        <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/booksServlet">
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
                                    <input type="text" class="form-control" name="book_Title">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-4">Author Name:</label>
                                <div class="col-sm-12">
                                    <input type="text" class="form-control"name="book_AuthorName">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-4">Book Description:</label>
                                <div class="col-sm-12">
                                    <textarea class="form-control"  name="book_Description" rows="5"></textarea>
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="control-label col-sm-4">Price:</label>
                                <div class="col-sm-12">
                                    <input type="text" class="form-control" name="book_Price">
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="control-label col-sm-4">No of Stocks:</label>
                                <div class="col-sm-12">
                                    <input type="text" class="form-control"  name="book_NoOfStocks">
                                </div>
                            </div>

                            <button type="submit" class="btn btn-primary btn-block mb-4" value="submit" >SUBMIT</button>

                        </form>
                    </div>
                </div>

                <div class="tab-pane fade" id="list-books">

                    <table class="table table-bordered table-hover">
                        <thead class="thead-dark">
                        <tr>
                            <th class="text-center" scope="col">ID</th>
                            <th class="text-center" scope="col">Title</th>
                            <th class="text-center" scope="col">Author Name</th>
                            <th class="text-center" scope="col">Description</th>
                            <th class="text-center" scope="col">Price</th>
                            <th class="text-center" scope="col">No of Stocks</th>
                            <th class="text-center" scope="col">Category Name</th>
                            <th class="text-center" scope="col">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            try{
                                con = DriverManager.getConnection(dbUrl, dbUname, dbPassword);
                                statement=con.createStatement();
                                String sql ="select * from book Inner join category on book.category_ID = category.category_ID";
                                resultSet = statement.executeQuery(sql);
                                int i=1;
                                while(resultSet.next()){
                        %>
                            <tr>
                                <th class="text-center" scope="row"><%=i%></th>
                                <td align="center"><%=resultSet.getString("book_Title") %></td>
                                <td align="center"><%=resultSet.getString("book_AuthorName") %></td>
                                <td align="center"><%=resultSet.getString("book_Description") %></td>
                                <td align="center"><%=resultSet.getString("book_price") %></td>
                                <td align="center"><%=resultSet.getString("book_NoOfStocks") %></td>
                                <td align="center"><%=resultSet.getString("category_Name") %></td>


                                <td align="center" class="col-2">
                                    <button type="button" class="btn btn-danger btn-sm rounded-0"><i class="material-icons" title="Edit">&#xE254</i></button>
                                    <a href="deleteBooks.jsp?id=<%=resultSet.getString("book_ID") %>"><button type="button" class="btn btn-danger btn-sm rounded-0"><i class="material-icons" title="Delete">&#xE872;</i></button></a>
                                </td>
                            </tr>
                        <%
                                    i++;
                                }
                                con.close();
                            }
                            catch (Exception e) {
                                e.printStackTrace();
                            }
                        %>

                        </tbody>
                    </table>

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
