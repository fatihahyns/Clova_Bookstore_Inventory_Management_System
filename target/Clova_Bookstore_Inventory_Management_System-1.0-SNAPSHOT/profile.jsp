<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 8/1/2022
  Time: 11:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="java.sql.DriverManager" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>
<%@ page import="java.sql.Connection" %>

<html>
<head>
    <title>Profile | Bookstore Inventory Management System</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
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
<%
    String admin_Name = (String) session.getAttribute("admin_Name");
    if (admin_Name == null)
    { response.sendRedirect("login.jsp")
    ;}
%>
<body class="is-preload">
<!-- Wrapper -->
<div id="wrapper">

    <!-- Header -->
    <header id="header">
        <div class="inner">

            <!-- Logo -->
            <a href="index.jsp" class="logo">
                <span class="fa fa-book"></span> <span class="title">Clova Bookstore Inventory Management System</span>
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

            <li><a href="books.jsp">Books</a></li>

            <li><a href="category.jsp">Category</a></li>

            <li><a href="suppliers.jsp">Suppliers</a></li>

            <li><a href="orders.jsp">Orders</a></li>

            <li>
                <a href="#" class="dropdown-toggle">Account</a>

                <ul>
                    <li><a href="profile.jsp"  class="active">Profile</a></li>
                    <li><a href="${pageContext.request.contextPath}/logoutServlet">Log out</a></li>
                </ul>
            </li>

        </ul>
    </nav>
    <!-- Main -->
    <div id="main">
        <div class="inner">
            <h1>Admin Profile</h1>

            <div class="bkstr-form">
                <form class="form-horizontal" action="UpdateProfileServlet?action=edit" method="post">
                    <div class="form-group">
                        <%--<label class="control-label col-sm-4">Admin ID:</label>--%>
                        <div class="col-sm-12">
                            <input type="text" class="form-control" name="admin_ID" value="<%=session.getAttribute("admin_ID")%>" hidden/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="control-label col-sm-4">Admin Name:</label>
                        <div class="col-sm-12">
                            <input type="text" class="form-control" name="admin_Name" value="<%=session.getAttribute("admin_Name")%>">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-4">Username:</label>
                        <div class="col-sm-12">
                            <input type="text" class="form-control" name="admin_Username" value="<%=session.getAttribute("admin_Username")%>">
                        </div>
                    </div>

                    <div class="form-group">
                        <label class="control-label col-sm-4">Email Address:</label>
                        <div class="col-sm-12">
                            <input type="email" class="form-control"  name="admin_Email" value="<%=session.getAttribute("admin_Email")%>">
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="control-label col-sm-4">Password:</label>
                        <div class="col-sm-12">
                            <input type="password" class="form-control" name="admin_Password" value="<%=session.getAttribute("admin_Password")%>">
                        </div>
                    </div>


                    <div class="form-group">
                        <label class="control-label col-sm-4">Contact No:</label>
                        <div class="col-sm-12">
                            <input type="text" class="form-control"  name="admin_PhoneNo" value="<%=session.getAttribute("admin_PhoneNo")%>">
                        </div>
                    </div>

                    <button type="submit" class="btn btn-primary btn-block mb-4" name="update" >UPDATE PROFILE</button>

                </form>
            </div>

        </div>
    </div>

    <!-- Footer -->
    <footer id="footer">
        <div class="inner">


            <ul class="copyright">
                <li>Copyright © 2021 CLOVA BOOKSTORE </li>
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
