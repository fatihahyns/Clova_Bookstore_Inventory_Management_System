<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 8/1/2022
  Time: 11:30 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="cbims.DBConnect.DBConnection"%>
<%@ page import="java.text.DecimalFormat" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<html>
<head>
    <title>Orders | Bookstore Inventory Management System</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <link rel="stylesheet" href="assets/css/deletemodal.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
    <style>
        table.table td a {
            cursor: pointer;
            display: inline-block;
            margin: 0 5px;
            min-width: 24px;
        }

        table.table td a.view {
            color: #6E9EDA;
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

            <li><a href="orders.jsp"  class="active">Orders</a></li>


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
            <h1>Orders</h1>

            <!-- Tabs navs -->
            <ul class="nav nav-tabs mb-3" id="myTab">
                <li class="nav-item">
                    <a
                            class="nav-link active"
                            data-bs-toggle="tab"
                            href="#customer-details"
                    >Customer Details</a>
                </li>

                <li class="nav-item">
                    <a
                            class="nav-link"
                            data-bs-toggle="tab"
                            href="#item-details"
                    >Item Details</a>
                </li>
                <li class="nav-item">
                    <a
                            class="nav-link"
                            data-bs-toggle="tab"
                            href="#list-sales"
                    >List of Sales</a>
                </li>
            </ul>
            <!-- Tabs navs -->

            <!-- Tabs content -->
            <div class="tab-content">

                <div class="tab-pane fade show active" id="customer-details">
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

                            <button type="submit" class="btn btn-primary btn-block mb-4" name="Action" value="Add Customer" >CONTINUE</button>
                        </form>
                    </div>
                </div>

                <div class="tab-pane fade" id="item-details">
                    <div class="bkstr-form">
                            <form method="post" action="${pageContext.request.contextPath}/orderdetailsServlet">
                                <h2>Customer Details</h2>
                                <div class="form-row">
                                    <div class="form-group col-md-4">
                                        <label class="control-label">Name:</label>
                                        <input type="text" class="form-control" name="customer_Name"  value="<%=session.getAttribute("customer_Name")%>" readonly>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label class="control-label">Phone Number:</label>
                                        <input type="text" class="form-control"  name="customer_PhoneNo" value="<%=session.getAttribute("customer_PhoneNo")%>" readonly>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <label class="control-label">Email:</label>
                                        <input type="email" class="form-control" name="customer_Email" value="<%=session.getAttribute("customer_Email")%>" readonly>
                                    </div>
                                </div>
                                <h2>Item Details</h2>
                            <div class="form-row align-items-center">
                                <div class="col-sm-9 my-1">
                                    <select id = "BookDropdown" class="form-control" name="book_ID">
                                        <option value="" disabled selected>Select Book Title</option>
                                    <%
                                        Connection con = DBConnection.getConn();
                                        Statement st2 = con.createStatement();
                                        ResultSet rs2 = st2.executeQuery("SELECT * FROM book order by book_Title");
                                        while (rs2.next()){
                                    %>
                                    <option data-price="<%=rs2.getString("book_Price")%>"value="<%=rs2.getInt("book_ID") %>"><%=rs2.getString("book_Title") %></option>
                                    <%
                                        }
                                    %>
                                    </select>
                                    <input type="hidden" name="book_Price">
                                </div>
                                <div class="col-auto my-3">
                                    <button type="submit" class="btn btn-success" name="Action" value="Add to Cart">ADD</button>
                                </div>
                            </div>
                            </form>
                    </div>

                            <br>

                            <div class="table-responsive">
                                <table class="table table-bordered m-0">
                                    <thead>
                                    <tr>
                                        <!-- Set columns width -->
                                        <th class="text-center py-3 px-4" style="min-width: 100px;">Description</th>
                                        <th class="text-center py-3 px-4" style="width: 150px;">Price</th>
                                        <th class="text-center py-3 px-4" style="width: 250px;">Quantity</th>
                                        <th class="text-center py-3 px-4" style="width: 150px;">Total</th>
                                        <th class="text-center align-middle py-3 px-0" style="width: 100px;">Remove</th>
                                    </tr>
                                    </thead>
                                    <tbody>
                                    <%
                                        Statement st3 = con.createStatement();
                                        ResultSet rs3 = st3.executeQuery("SELECT od.*, bk.* FROM orderdetails od, book bk WHERE bk.book_ID = od.book_ID;");
                                        while (rs3.next()){
                                    %>

                                    <tr>
                                        <td class="p-4">
                                            <div class="media align-items-center">

                                                <div class="media-body">
                                                    <a href="#" class="d-block text-dark"><%=rs3.getString("book_Title") %></a>
                                                    <small>
                                                        <span class="text-muted">ISBN: </span><%=rs3.getString("book_ISBN") %>
                                                    </small>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="text-center font-weight-semibold align-middle p-4">RM <%=rs3.getString("orderdetails_Price") %></td>

                                        <td class="align-middle p-4">
                                            <form  method="post" action="${pageContext.request.contextPath}/orderdetailsServlet">
                                                <div class="form-row align-items-center">
                                                    <input type="hidden" name="book_ID" value="<%=rs3.getString("book_ID") %>">
                                                    <div class="col-sm-4 my-0">
                                                        <input type="number" min="1" class="form-control text-center" name="quantity" value="<%=rs3.getString("orderdetails_Quantity") %>">
                                                    </div>
                                                    <div class="col-auto my-3">
                                                        <button class="btn btn-danger btn-sm rounded-0"  name="Action" value="Update Quantity"><i class="material-icons" title="Update">&#xe5d5;</i></button>
                                                    </div>
                                                </div>
                                            </form>
                                        </td>

                                        <td class="text-center font-weight-semibold align-middle p-4">RM <%=rs3.getString("orderdetails_TotalPrice") %></td>
                                        <td class="text-center align-middle px-0">
                                        <button type="button" data-toggle="modal" data-target="#removeFromCart" id="<%=rs3.getString("book_ID")%>" class="del btn btn-danger btn-sm rounded-0" title="Remove">×</button>
                                        </td>
                                    </tr>
                                    <%
                                        }
                                    %>

                                    </tbody>
                                </table>


                            <div class="d-flex flex-wrap justify-content-between align-items-center pb-4">
                                <div class="mt-4">

                                    <input type="hidden" placeholder="ABC" class="form-control">
                                </div>
                                <div class="d-flex">
                                    <div class="text-right mt-4 mr-5">

                                        <input type="hidden" placeholder="ABC" class="form-control">
                                    </div>

                                    <%
                                        DecimalFormat df = new DecimalFormat("##. 00");
                                        double finalTotalPrice = 0.00;
                                        Statement st4 = con.createStatement();
                                        ResultSet rs4 = st4.executeQuery("select sum(orderDetails_TotalPrice) from orderdetails");
                                        if (rs4.next()) {
                                            finalTotalPrice = rs4.getInt(1);
                                        }
                                    %>
                                    <div class="text-right mt-4">
                                        <label class="text-muted font-weight-normal m-0">Total price</label>
                                        <div class="text-large"><strong>RM <%=df.format(finalTotalPrice)%></strong></div>
                                    </div>
                                </div>
                            </div>

                            <form method="post" action="${pageContext.request.contextPath}/ordersServlet">

                                <button type="submit" class="btn btn-primary btn-block mb-4" name="Action" value="Place Order">BUY</button>

                            </form>

                    </div>
                </div>

                <div class="tab-pane fade" id="list-sales">
                    <%--                    search order--%>
                    <form class="form-horizontal" method="get">
                        <div class="form-row align-items-center">
                            <div class="col-sm-11 my-1">
                                <input type="input" class="form-control" name="searchdata" placeholder="Search order No / order date / cutomer name">
                            </div>


                            <div class="col-auto my-1">
                                <button type="submit" class="btn btn-primary">SEARCH</button>
                            </div>
                        </div>
                    </form>

                    <table class="table table-bordered table-hover">
                        <thead class="thead-dark">
                        <tr>
                            <th class="text-center" scope="col">No.</th>
                            <th class="text-center" scope="col">Order No.</th>
                            <th class="text-center" scope="col">Order Date Time</th>
                            <th class="text-center" scope="col">Customer Name</th>
                            <th class="text-center" scope="col">Total Price</th>
                            <th class="text-center" scope="col">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <%
                            Statement st5 = con.createStatement();
                            String search = request.getParameter("searchdata");
                            String sql;

                            if(search != null){
                                sql = "SELECT *  FROM orders WHERE order_No like '%"+search+"%' OR customer_Name like '%"+search+"%' OR order_DateTime like '%"+search+"%'";


                            }else{
                                sql = "select * from orders";
                            }
                            ResultSet rs5 = st5.executeQuery(sql);
                            int i=1, count=0;
                            while (rs5.next()) {
                        %>
                        <tr>
                            <th class="text-center" scope="row"><%=i%></th>
                            <th class="text-center" scope="row"><%=rs5.getString("order_No") %></th>
                            <td align="center"><%=rs5.getString("order_DateTime") %></td>
                            <td align="center"><%=rs5.getString("customer_Name") %></td>
                            <td align="center">RM <%=rs5.getString("orderDetails_TotalPrice") %></td>
                            <td align="center" class="col-2">
                                <button type="button" data-toggle="modal" data-target="#viewOrderDetails" id="<%=rs5.getString("order_No")%>" class="view btn btn-primary btn-sm rounded-0" title="View"><i class="material-icons">visibility</i></button>
                            </td>
                        </tr>
                        <% i++;
                            count++;
                            }%>
                        </tbody>
                    </table>
                    <b>Total record(s): </b><%=count%>
                </div>
            </div>
            <!-- Tabs content -->

            <!-- Delete Pop up -->
            <div class="modal fade" id="removeFromCart" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true">
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

            <!-- View Pop up -->
            <div class="modal fade" id="viewOrderDetails" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Order Details</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span></button>
                        </div>
                        <div class="modal-body">
                            <div id="show-data3"></div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- View Pop up -->


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

<script>
    $(document).ready(function(){
        $('#CustomerDropdown').on('change', function(event){
            var optionSelected = $("option:selected", this);
            var cName = $(optionSelected).data('name');  // note the data-member-id --> memberId change
            var cPNo = $(optionSelected).data('phone');
            var cEmail = $(optionSelected).data('email');

            $('input[name="customer_Name"]').val(cName);
            $('input[name="customer_PhoneNo"]').val(cPNo);
            $('input[name="customer_Email"]').val(cEmail);
        });
    });
</script>

<script>
    $(document).ready(function(){
        $('#BookDropdown').on('change', function(event){
            var optionSelected = $("option:selected", this);
            var bPrice = $(optionSelected).data('price');  // note the data-member-id --> memberId change

            $('input[name="book_Price"]').val(bPrice);
        });
    });
</script>

<script type="text/javascript">
    $(document).ready(function (){
        $('.del').click(function(){
            var id = +this.id;
            $.ajax({
                url: "removeBookFromCart.jsp",
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

<script type="text/javascript">
    $(document).ready(function (){
        $('.view').click(function(){
            var id = +this.id;
            $.ajax({
                url: "viewOrderDetails.jsp",
                type:"post",
                data:{
                    id: id,
                },
                success:function (data){
                    $("#show-data3").html(data);
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
