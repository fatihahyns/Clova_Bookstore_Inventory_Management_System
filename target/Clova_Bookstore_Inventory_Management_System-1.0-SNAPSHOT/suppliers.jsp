<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 8/1/2022
  Time: 11:32 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Suppliers | Bookstore Inventory Management System</title>
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

            <li><a href="books.jsp">Books</a></li>

            <li><a href="category.jsp">Category</a></li>

            <li><a href="suppliers.jsp" class="active">Suppliers</a></li>

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
            <h1>Suppliers</h1>

            <!-- Tabs navs -->
            <ul class="nav nav-tabs mb-3">
                <li class="nav-item">
                    <a
                            class="nav-link active"
                            data-bs-toggle="tab"
                            href="#add-suppliers"
                    >Add Suppliers</a
                    >
                </li>
                <li class="nav-item">
                    <a
                            class="nav-link"
                            data-bs-toggle="tab"
                            href="#list-suppliers"
                    >List of Suppliers</a
                    >
                </li>
            </ul>
            <!-- Tabs navs -->

            <!-- Tabs content -->
            <div class="tab-content">
                <div
                        class="tab-pane fade show active"
                        id="add-suppliers">

                    <div class="bkstr-form">
                        <form class="form-horizontal">
                            <div class="form-group">
                                <label class="control-label col-sm-4">Name:</label>
                                <div class="col-sm-12">
                                    <input type="text" class="form-control" name="supplier_Name">
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="control-label col-sm-4">Address 1 (No/Unit/Street):</label>
                                <div class="col-sm-12">
                                    <input type="text" class="form-control"  name="supplier_Address">
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="control-label col-sm-4">Address 2 (Postcode):</label>
                                <div class="col-sm-12">
                                    <input type="text" class="form-control"  name="supplier_Postcode">
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="control-label col-sm-4">Address 3 (City):</label>
                                <div class="col-sm-12">
                                    <input type="email" class="form-control" name="supplier_City">
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="control-label col-sm-4">Address 4 (State):</label>
                                <div class="col-sm-12">
                                    <input type="text" class="form-control"  name="supplier_State">
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="control-label col-sm-4">Phone No:</label>
                                <div class="col-sm-12">
                                    <input type="text" class="form-control"  name="supplier_PhoneNo"  rows="5">

                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-4">Email:</label>
                                <div class="col-sm-12">
                                    <input type="text" class="form-control"  name="supplier_Email">
                                </div>
                            </div>

                            <button type="submit" class="btn btn-primary btn-block mb-4" name="update" >SUBMIT</button>

                        </form>
                    </div>
                </div>

                <div class="tab-pane fade" id="list-suppliers">

                    <table class="table table-bordered table-hover">
                        <thead class="thead-dark">
                        <tr>
                            <th class="text-center" scope="col">ID</th>
                            <th class="text-center" scope="col">Name</th>
                            <th class="text-center" scope="col">Address</th>
                            <th class="text-center" scope="col">Phone Number</th>
                            <th class="text-center" scope="col">Email</th>
                            <th class="text-center" scope="col">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th class="text-center" scope="row">1</th>
                            <td align="center">Falcon Press</td>
                            <td align="center">Petaling Jaya, Selangor</td>
                            <td align="center">03-77818128</td>
                            <td align="center">info@falconpub.com</td>
                            <td align="center" class="col-2">
                                <a class="edit editbtn" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>

                                <a class="delete" name="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
                            </td>
                        </tr>
                        <tr>
                            <th class="text-center" scope="row">2</th>
                            <td align="center">Advantage Quest</td>
                            <td align="center">Petaling Jaya, Selangor</td>
                            <td align="center">03-79323533</td>
                            <td align="center">info@advanquest.com</td>
                            <td align="center" class="col-2">
                                <a class="edit editbtn" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>

                                <a class="delete" name="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
                            </td>
                        </tr>
                        <tr>
                            <th class="text-center" scope="row">3</th>
                            <td align="center">Berlian Books</td>
                            <td align="center">Puchong, Selangor</td>
                            <td align="center">03-80600687</td>
                            <td align="center">info@berlianbooks.com</td>
                            <td align="center" class="col-2">
                                <a class="edit editbtn" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>

                                <a class="delete" name="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
                            </td>
                        </tr>
                        <tr>
                            <th class="text-center" scope="row">4</th>
                            <td align="center">Pelangi Books</td>
                            <td align="center">Bandar Baru Bangi, Selangor</td>
                            <td align="center">03-89223993</td>
                            <td align="center">info@pelangibooks.com</td>
                            <td align="center" class="col-2">
                                <a class="edit editbtn" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>

                                <a class="delete" name="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
                            </td>
                        </tr>
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
