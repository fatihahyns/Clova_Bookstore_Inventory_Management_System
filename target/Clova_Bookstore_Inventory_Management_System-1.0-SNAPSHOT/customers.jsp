<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 8/1/2022
  Time: 11:29 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="cbims.DBConnect.DBConnection"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Customers | Bookstore Inventory Management System</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <link rel="stylesheet" href="assets/css/deletemodal.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <style>
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

            <li><a href="customers.jsp" class="active">Customers</a></li>

            <li><a href="orders.jsp">Orders</a></li>

            <li>
                <a href="#" class="dropdown-toggle">Account</a>

                <ul>
                    <li><a href="profile.jsp">Profile</a></li>
                    <li><a href="${pageContext.request.contextPath}/logoutServlet">Log out</a></li>
                </ul>
            </li>

        </ul>
    </nav>

    <!-- Main -->
    <div id="main">
        <div class="inner">
            <h1>Customers</h1>

            <!-- Tabs navs -->
            <ul class="nav nav-tabs mb-3" id="myTab">
                <li class="nav-item">
                    <a
                            class="nav-link active"
                            data-bs-toggle="tab"
                            href="#new-customer"
                    >New Customer</a
                    >
                </li>
                <li class="nav-item">
                    <a
                            class="nav-link"
                            data-bs-toggle="tab"
                            href="#list-customers"
                    >List of Customers</a
                    >
                </li>
            </ul>
            <!-- Tabs navs -->

            <!-- Tabs content -->
            <div class="tab-content">
                <div
                        class="tab-pane fade show active"
                        id="new-customer">

                    <div class="bkstr-form">
                        <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/customersServlet">
                            <div class="form-group">
                                <label class="control-label col-sm-4">Full Name:</label>
                                <div class="col-sm-12">
                                    <input type="text" class="form-control"name="customer_Name">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-4">Phone Number:</label>
                                <div class="col-sm-12">
                                    <input type="text" class="form-control"  name="customer_PhoneNo">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-4">Email:</label>
                                <div class="col-sm-12">
                                    <input type="email" class="form-control" name="customer_Email">
                                </div>
                            </div>

                            <button type="submit" class="btn btn-primary btn-block mb-4" name="Action" value="Add Customer" >SUBMIT</button>
                        </form>
                    </div>
                </div>


                <div class="tab-pane fade" id="list-customers">
<%--                    search customer--%>
    <form class="form-horizontal" method="get">
        <div class="form-row align-items-center">
            <div class="col-sm-11 my-1">
                <input type="input" class="form-control" name="searchdata" placeholder="Search...">
            </div>


            <div class="col-auto my-1">
                <button type="submit" class="btn btn-primary">SEARCH</button>
            </div>
        </div>
    </form>
    <br>
<%--                    list customer--%>
                    <table class="table table-bordered table-hover">
                        <thead class="thead-dark">
                        <tr>
                            <th class="text-center" scope="col">No.</th>
                            <th class="text-center" scope="col">Name</th>
                            <th class="text-center" scope="col">Phone Number</th>
                            <th class="text-center" scope="col">Email</th>
                            <th class="text-center" scope="col">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            Connection con = DBConnection.getConn();
                            Statement st = con.createStatement();
                            String search = request.getParameter("searchdata");
                            String sql;

                            if(search != null){
                                sql = "SELECT * FROM customer WHERE customer_Name like '%"+search+"%' OR customer_PhoneNo like '%"+search+"%' OR customer_Email like '%"+search+"%'";


                            }else{
                                sql = "SELECT * FROM customer";
                            }

                            ResultSet rs = st.executeQuery(sql);
                            int i=1;
                            while (rs.next()){

                        %>
                            <tr>
                                <th class="text-center" scope="row"><%=i%></th>
                                <td align="center"><%=rs.getString("customer_Name") %></td>
                                <td align="center"><%=rs.getString("customer_PhoneNo") %></td>
                                <td align="center"><%=rs.getString("customer_Email") %></td>
                                <td align="center" class="col-2">
                                    <button type="button" data-toggle="modal" data-target="#updateCustomer" id="<%=rs.getInt("customer_ID") %>" class="btn btn-success btn-sm rounded-0"><i class="material-icons" title="Edit">&#xE254;</i></button>
                                    <button type="button" data-toggle="modal" data-target="#deleteCustomer" id="<%=rs.getInt("customer_ID") %>" class="del btn btn-danger btn-sm rounded-0"><i class="material-icons" title="Delete">&#xE872;</i></button>
                                </td>
                            </tr>
                        <%
                                    i++;
                                }
                        %>
                         </tbody>
                    </table>
 </div>
            </div>
            <!-- Tabs content -->
        </div>
    </div>

    <!-- Update Pop up -->
    <div class="modal fade" id="updateCustomer" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="exampleModalLabel">Edit Book</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span></button>
                </div>
                <div class="modal-body">
                    <div id="show-data"></div>
                </div>
            </div>
        </div>
    </div>
    <!-- Update Pop up -->

    <!-- Delete Pop up -->
    <div class="modal fade" id="deleteCustomer" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true">
        <div class="modal-dialog modal-confirm">
            <div class="modal-content">
                <div class="modal-header flex-column">
                    <div class="icon-box">
                        <i class="material-icons">&#xE5CD;</i>
                    </div>
                    <h4 class="modal-title w-100">Are you sure?</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                </div>
                <div class="modal-body">
                    <div id="show-data2"></div>
                </div>
            </div>
        </div>
    </div>
    <!-- Delete Pop up -->



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

<script type="text/javascript">
    $(document).ready(function (){
        $('.btn-success').click(function(){
            var id = +this.id;
            $.ajax({
                url: "editCustomers.jsp",
                type:"post",
                data:{
                    id: id,
                },
                success:function (data){
                    $("#show-data").html(data);
                }
            });
        });
    });
</script>

<script type="text/javascript">
    $(document).ready(function (){
        $('.del').click(function(){
            var id = +this.id;
            $.ajax({
                url: "deleteCustomers.jsp",
                type:"post",
                data:{
                    id: id,
                },
                success:function (data){
                    $("#show-data2").html(data);
                }
            });
        });
    });
</script>

<script>
    $('#myTab a').click(function (e) {
        e.preventDefault()
        $(this).tab('show')
    });

    // store the currently selected tab in the hash value
    $("ul.nav-tabs > li > a").on("shown.bs.tab", function (e) {
        var id = $(e.target).attr("href").substr(1);
        window.location.hash = id;
    });

    // on load of the page: switch to the currently selected tab
    var hash = window.location.hash;
    $('#myTab a[href="' + hash + '"]').tab('show');
</script>

</body>
</html>
