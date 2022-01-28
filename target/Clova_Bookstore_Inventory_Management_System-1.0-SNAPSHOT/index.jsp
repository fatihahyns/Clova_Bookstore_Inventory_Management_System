<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<!DOCTYPE html>
<html>
<head>
    <title>Dashboard | Bookstore Inventory Management System</title>
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
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
            <li><a href="index.jsp" class="active">Dashboard</a></li>

            <li><a href="books.jsp">Books</a></li>

            <li><a href="category.jsp">Category</a></li>

            <li><a href="suppliers.jsp">Suppliers</a></li>

            <li><a href="orders.jsp">Orders</a></li>

            <li><a href="customers.jsp">Customers</a></li>

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
            <h1>Dashboard</h1>

            <div class="image main">
                <img src="images/banner-image-6-1920x500.jpg" class="img-fluid" alt="" />
            </div>

            <!-- Products -->
            <section class="tiles">
                <article class="style1">
									<span class="image">
										<img src="images/product-1-720x480.jpg" alt="" />
									</span>
                    <a href="books.jsp">
                        <h2>TOTAL BOOKS</h2>
                        <sql:setDataSource var="ic" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/cbims" user="root" password=""/>
                        <sql:query dataSource="${ic}" var="oc">
                            SELECT COUNT(book_ID) AS count FROM book;
                        </sql:query>
                        <c:forEach var="row" items="${oc.rows}">
                            <p style="font-size:500%;"><strong>${row.count}</strong></p>
                        </c:forEach>
                    </a>
                </article>

                <article class="style2">
									<span class="image">
										<img src="images/product-2-720x480.jpg" alt="" />
									</span>
                    <a href="category.jsp">
                        <h2>TOTAL CATEGORY</h2>
                        <sql:setDataSource var="ic" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/cbims" user="root" password=""/>
                        <sql:query dataSource="${ic}" var="oc">
                            SELECT COUNT(category_ID) AS count FROM category;
                        </sql:query>
                        <c:forEach var="row" items="${oc.rows}">
                            <p style="font-size:500%;"><strong>${row.count}</strong></p>
                        </c:forEach>
                    </a>
                </article>
                <article class="style3">
									<span class="image">
										<img src="images/product-3-720x480.jpg" alt="" />
									</span>
                    <a href="suppliers.jsp">
                        <h2>TOTAL SUPPLIERS</h2>
                        <sql:setDataSource var="ic" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/cbims" user="root" password=""/>
                        <sql:query dataSource="${ic}" var="oc">
                            SELECT COUNT(supplier_ID) AS count FROM supplier;
                        </sql:query>
                        <c:forEach var="row" items="${oc.rows}">
                            <p style="font-size:500%;"><strong>${row.count}</strong></p>
                        </c:forEach>
                    </a>
                </article>

                <article class="style4">
									<span class="image">
										<img src="images/product-4-720x480.jpg" alt="" />
									</span>
                    <a href="customers.jsp">
                        <h2>TOTAL CUSTOMERS</h2>
                        <sql:setDataSource var="ic" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/cbims" user="root" password=""/>
                        <sql:query dataSource="${ic}" var="oc">
                            SELECT COUNT(customer_ID) AS count FROM customer;
                        </sql:query>
                        <c:forEach var="row" items="${oc.rows}">
                            <p style="font-size:500%;"><strong>${row.count}</strong></p>
                        </c:forEach>
                    </a>
                </article>

                <article class="style5">
									<span class="image">
										<img src="images/product-5-720x480.jpg" alt="" />
									</span>
                    <a href="#">
                        <h2>TOTAL SALES</h2>
                        <sql:setDataSource var="ic" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/cbims" user="root" password=""/>
                        <sql:query dataSource="${ic}" var="oc">
                            SELECT COUNT(order_ID) AS count FROM orders;
                        </sql:query>
                        <c:forEach var="row" items="${oc.rows}">
                            <p style="font-size:500%;"><strong>${row.count}</strong></p>
                        </c:forEach>
                    </a>
                </article>

                <article class="style6">
									<span class="image">
										<img src="images/product-6-720x480.jpg" alt="" />
									</span>
                    <a href="#">
                        <h2>TOTAL ADMIN</h2>
                        <sql:setDataSource var="ic" driver="com.mysql.jdbc.Driver" url="jdbc:mysql://localhost:3306/cbims" user="root" password=""/>
                        <sql:query dataSource="${ic}" var="oc">
                            SELECT COUNT(admin_ID) AS count FROM admin;
                        </sql:query>
                        <c:forEach var="row" items="${oc.rows}">
                            <p style="font-size:500%;"><strong>${row.count}</strong></p>
                        </c:forEach>
                    </a>
                </article>
            </section>
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
</body>
</html>