<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 8/1/2022
  Time: 10:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
                                    <input type="text" class="form-control"  name="book_Description" rows="5">
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="control-label col-sm-4">Price:</label>
                                <div class="col-sm-12">
                                    <input type="email" class="form-control" name="book_Price">
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="control-label col-sm-4">No of Stocks:</label>
                                <div class="col-sm-12">
                                    <input type="text" class="form-control"  name="book_NoOfStocks">
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="control-label col-sm-4">Category:</label>
                                <div class="col-sm-12">
                                    <select class="form-control" name="category_ID">
                                        <option value="" disabled selected>Select Category</option>
                                        <option value="1">Accounting and Finance</option>
                                        <option value="2">Business and Economics</option>
                                        <option value="3">Computing and internet</option>
                                        <option value="4">Engineering</option>
                                    </select>

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
                        <tr>
                            <th class="text-center" scope="row">1</th>
                            <td align="center">Inside the Science of Extraordinary Athletic Performance</td>
                            <td align="center">David Epstein</td>
                            <td align="center">The Sports Gene is a nonfiction book, at the time a senior writer for Sports Illustrated, on the effects of genetics and sports training on human athleticism.</td>
                            <td align="center">RM150.00</td>
                            <td align="center">353</td>
                            <td align="center">Sport Science</td>
                            <td align="center" class="col-2">
                                <a class="edit editbtn" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>

                                <a class="delete" name="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
                            </td>
                        </tr>
                        <tr>
                            <th class="text-center" scope="row">2</th>
                            <td align="center">The Art Spirit</td>
                            <td align="center">Robert Henri</td>
                            <td align="center">In this book are the essential beliefs and theories of a great teacher and American artist, Robert Henri</td>
                            <td align="center">RM99.00</td>
                            <td align="center">834</td>
                            <td align="center">Arts</td>
                            <td align="center" class="col-2">
                                <a class="edit editbtn" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>

                                <a class="delete" name="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
                            </td>
                        </tr>
                        <tr>
                            <th class="text-center" scope="row">3</th>
                            <td align="center">Theory of Machines</td>
                            <td align="center">J.K. Gupta, R.S. Khurmi, and RS Khurmi | JK Gupta</td>
                            <td align="center">Theory of Machines is designed mainly for the students of mechanical engineering. It focuses on recent developments on the new mechanisms in the field of kinematics.</td>
                            <td align="center">RM199.00</td>
                            <td align="center">67</td>
                            <td align="center">Engineering</td>
                            <td align="center" class="col-2">
                                <a class="edit editbtn" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>

                                <a class="delete" name="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
                            </td>
                        </tr>
                        <tr>
                            <th class="text-center" scope="row">4</th>
                            <td align="center">Freakonomics</td>
                            <td align="center">Stephen J. Dubner and Steven Levitt</td>
                            <td align="center">A Rogue Economist Explores the Hidden Side of Everything is the debut non-fiction book by University of Chicago economist Steven Levitt and New York Times journalist Stephen J. Dubner.</td>
                            <td align="center">RM125.00</td>
                            <td align="center">555</td>
                            <td align="center">Business and Economics</td>
                            <td align="center" class="col-2">
                                <a class="edit editbtn" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>

                                <a class="delete" name="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
                            </td>
                        </tr>
                        <tr>
                            <th class="text-center" scope="row">5</th>
                            <td align="center">The Big Short: Inside the Doomsday Machine</td>
                            <td align="center">Michael Lewis</td>
                            <td align="center">The Big Short: Inside the Doomsday Machine is a nonfiction book by Michael Lewis about the build-up of the United States housing bubble during the 2000s.</td>
                            <td align="center">RM210.00</td>
                            <td align="center">178</td>
                            <td align="center">Business and Economics</td>
                            <td align="center" class="col-2">
                                <a class="edit editbtn" title="Edit" data-toggle="tooltip"><i class="material-icons">&#xE254;</i></a>

                                <a class="delete" name="delete" title="Delete" data-toggle="tooltip"><i class="material-icons">&#xE872;</i></a>
                            </td>
                        </tr>
                        <tr>
                            <th class="text-center" scope="row">6</th>
                            <td align="center">Complications: A Surgeon's Notes on an Imperfect Science</td>
                            <td align="center">Atul Gawande</td>
                            <td align="center">Gawande wrote this during his general surgery residency at Brigham and Women's Hospital and was published in 2002 by Picador.</td>
                            <td align="center">RM345.00</td>
                            <td align="center">299</td>
                            <td align="center">Health and Medicines</td>
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
