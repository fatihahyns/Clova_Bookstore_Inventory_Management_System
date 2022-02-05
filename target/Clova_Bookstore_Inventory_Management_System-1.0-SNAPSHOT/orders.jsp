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

            <li><a href="suppliers.jsp">Suppliers</a></li>

            <li><a href="customers.jsp">Customers</a></li>

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
            <ul class="nav nav-tabs mb-3">
                <li class="nav-item">
                    <a
                            class="nav-link active"
                            data-bs-toggle="tab"
                            href="#new-order"
                    >New Order</a
                    >
                </li>
                <li class="nav-item">
                    <a
                            class="nav-link"
                            data-bs-toggle="tab"
                            href="#list-orders"
                    >List of Orders</a
                    >
                </li>
            </ul>
            <!-- Tabs navs -->

            <!-- Tabs content -->
            <div class="tab-content">
                <div
                        class="tab-pane fade show active"
                        id="new-order">

                    <div class="bkstr-form">
                        <form class="form-horizontal">
                            <h2>Customer Details</h2>

                            <div class="form-row">
                                <div class="form-group col-sm-4">
                                    <label class="control-label">Order ID:</label>
                                    <%
                                        Connection con = DBConnection.getConn();
                                        Statement st = con.createStatement();
                                        ResultSet rs = st.executeQuery("SELECT order_ID FROM orders");
                                        while (rs.next()){
                                    %>
                                    <input type="text" class="form-control" name="order_ID" value="<%=rs.getString("order_ID")%>" disabled>
                                    <%
                                        }
                                    %>
                                </div>


                                <div class="form-group col-sm-4">
                                    <label class="control-label">Order Date:</label>
                                    <input type="text" class="form-control" name="order_DateTime" placeholder="2021-12-08 13:23:44" disabled>
                                </div>

                                <div class="form-group col-md-4">
                                    <label class="control-label">Customer ID:</label>
                                    <select  id = "CustomerDropdown" class="form-control" name="CustomerDropdown">
                                        <option value="" disabled selected>Select Customer ID</option>
                                        <%
                                            Statement st1 = con.createStatement();
                                            ResultSet rs1 = st1.executeQuery("SELECT * FROM customer");
                                            while (rs1.next()){
                                        %>
                                        <option data-name="<%=rs1.getString("customer_Name")%>" data-phone="<%=rs1.getString("customer_PhoneNo")%>" data-email="<%=rs1.getString("customer_Email")%>" value="<%=rs1.getString("customer_ID") %>"><%=rs1.getString("customer_ID") %></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>

                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <label class="control-label">Name:</label>
                                    <input type="text" class="form-control" name="customer_Name" readonly>
                                </div>
                                <div class="form-group col-md-4">
                                    <label class="control-label">Phone Number:</label>
                                    <input type="text" class="form-control"  name="customer_PhoneNo" readonly>
                                </div>
                                <div class="form-group col-md-4">
                                    <label class="control-label">Email:</label>
                                    <input type="email" class="form-control" name="customer_Email" readonly>
                                </div>
                            </div>
                        </form>



                            <br>
                            <h2>Item Details</h2>
                            <form method="post" action="${pageContext.request.contextPath}/orderdetailsServlet">
                            <div class="form-row align-items-center">

<%--                                <div class="col-sm-4 my-1">--%>
<%--&lt;%&ndash;                                    <select class="form-control" id="category" name="category" onchange="javascript: dynamicdropdown(this.options[this.selectedIndex].value);">&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <option value="" disabled selected>Select Category</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <option value="acc">Accounting & Finance</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <option value="bs">Business & Economics</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <option value="comp">Computing & Internet</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                        <option value="eng">Engineering</option>&ndash;%&gt;--%>
<%--&lt;%&ndash;                                    </select>&ndash;%&gt;--%>
<%--                                        <select class="form-control" id="category" name="category">--%>
<%--                                            <option>Select category</option>--%>
<%--                                        </select>--%>
<%--                                </div>--%>


                                <div class="col-sm-8 my-1">
                                    <!-- <label class="control-label">Book:</label> -->

<%--                                    <script>--%>
<%--                                        document.write('<select class="form-control" name="book" id="book"><option value="">Select book</option></select>')--%>
<%--                                    </script>--%>

<%--                                    <noscript>--%>
<%--                                        <select class="form-control" id="book" name="book">--%>
<%--                                            <option value="acc1">Everyone Can Buy Property</option>--%>
<%--                                            <option value="acc2">One Up On Wall Street</option>--%>
<%--                                            <option value="bs1">Beyond Entrepreneurship 2.0</option>--%>
<%--                                            <option value="bs2">The Ride of a Lifetime</option>--%>
<%--                                            <option value="comp1">Cloud Native Security</option>--%>
<%--                                            <option value="comp2">Data Lakes For Dummies</option>--%>
<%--                                            <option value="eng1">Think Like An Engineer</option>--%>
<%--                                            <option value="eng2">How to Invent Everything</option>--%>
<%--                                        </select></noscript>--%>
                                    <select id = "BookDropdown" class="form-control" name="book_ID">
                                        <option value="" disabled selected>Select Book Title</option>

                                    <%
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

                                <div class="col-auto my-1">
                                    <button type="submit" class="btn btn-success" name="Action" value="Add to Cart">ADD</button>
                                </div>

                            </div>
                            </form>

                            <br>

                            <div class="table-responsive">
                                <table class="table table-bordered m-0">
                                    <thead>
                                    <tr>
                                        <!-- Set columns width -->
                                        <th class="text-center py-3 px-4" style="min-width: 200px;">Description</th>
                                        <th class="text-right py-3 px-4" style="width: 130px;">Price</th>
                                        <th class="text-center py-3 px-4" style="width: 100px;">Quantity</th>
                                        <th class="text-right py-3 px-4" style="width: 130px;">Total</th>
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
                                                        <span class="text-muted">Book ID: </span><%=rs3.getString("book_ID") %> &nbsp;
                                                    </small>
                                                </div>
                                            </div>
                                        </td>
                                        <td class="text-right font-weight-semibold align-middle p-4">RM <%=rs3.getString("orderdetails_Price") %></td>
                                        <td class="align-middle p-4"><input type="text" class="form-control text-center" value="<%=rs3.getString("orderdetails_Quantity") %>"></td>
                                        <td class="text-right font-weight-semibold align-middle p-4">RM <%=rs3.getString("orderdetails_TotalPrice") %></td>
                                        <td class="text-center align-middle px-0"><a href="#" class="shop-tooltip close float-none text-danger" title="" data-original-title="Remove">×</a></td>
                                    </tr>
                                    <%
                                        }
                                    %>
                                    </tbody>
                                </table>
                            </div>

                            <div class="d-flex flex-wrap justify-content-between align-items-center pb-4">
                                <div class="mt-4">
                                    <label class="text-muted font-weight-normal">Promocode</label>
                                    <input type="text" placeholder="ABC" class="form-control">
                                </div>
                                <div class="d-flex">
                                    <div class="text-right mt-4 mr-5">
                                        <label class="text-muted font-weight-normal m-0">Discount</label>
                                        <div class="text-large"><strong>RM 0.00</strong></div>
                                    </div>
                                    <%
                                        double finalTotalPrice = 0.00;
                                        Statement st4 = con.createStatement();
                                        ResultSet rs4 = st4.executeQuery("select sum(orderDetails_TotalPrice) from orderdetails");
                                        if (rs4.next()) {
                                            finalTotalPrice = rs4.getInt(1);
                                        }
                                    %>
                                    <div class="text-right mt-4">
                                        <label class="text-muted font-weight-normal m-0">Total price</label>
                                        <div class="text-large"><strong>RM <%=finalTotalPrice%></strong></div>
                                    </div>
                                </div>
                            </div>



                            <button type="submit" class="btn btn-primary btn-block mb-4" name="submit" >PLACE ORDER</button>

<%--                        </form>--%>
                    </div>
                </div>

                <div class="tab-pane fade" id="list-orders">

                    <table class="table table-bordered table-hover">
                        <thead class="thead-dark">
                        <tr>
                            <th class="text-center" scope="col">Order ID</th>
                            <th class="text-center" scope="col">Order Date Time</th>
                            <th class="text-center" scope="col">Customer Name</th>
                            <th class="text-center" scope="col">Total Price</th>
                            <th class="text-center" scope="col">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                        <tr>
                            <th class="text-center" scope="row">1</th>
                            <td align="center">2021-11-20 13:12:44</td>
                            <td align="center">Kalsum binti Said</td>
                            <td align="center">RM 45.90</td>
                            <td align="center" class="col-2">
                                <a class="view viewbtn" title="View" data-toggle="tooltip"><i class="material-icons">visibility</i></a>
                            </td>
                        </tr>
                        <tr>
                            <th class="text-center" scope="row">2</th>
                            <td align="center">2021-11-23 10:00:24</td>
                            <td align="center">Baktiar bin Zain</td>
                            <td align="center">RM 200.50</td>
                            <td align="center" class="col-2">
                                <a class="view viewbtn" title="View" data-toggle="tooltip"><i class="material-icons">visibility</i></a>
                            </td>
                        </tr>
                        <tr>
                            <th class="text-center" scope="row">3</th>
                            <td align="center">2021-11-30 20:32:18</td>
                            <td align="center">Kalsum binti Said</td>
                            <td align="center">RM 89.90</td>
                            <td align="center" class="col-2">
                                <a class="view viewbtn" title="View" data-toggle="tooltip"><i class="material-icons">visibility</i></a>
                            </td>
                        </tr>
                        <tr>
                            <th class="text-center" scope="row">4</th>
                            <td align="center">2021-11-30 21:12:44</td>
                            <td align="center">Jacob Tan</td>
                            <td align="center">RM 118.90</td>
                            <td align="center" class="col-2">
                                <a class="view viewbtn" title="View" data-toggle="tooltip"><i class="material-icons">visibility</i></a>
                            </td>
                        </tr>
                        <tr>
                            <th class="text-center" scope="row">5</th>
                            <td align="center">2021-12-04 09:20:11</td>
                            <td align="center">Natrah A/P Ravindran</td>
                            <td align="center">RM 37.50</td>
                            <td align="center" class="col-2">
                                <a class="view viewbtn" title="View" data-toggle="tooltip"><i class="material-icons">visibility</i></a>
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

<%--<script type="text/javascript">--%>
<%--    $(document).ready(function () {--%>
<%--        $.ajax({--%>
<%--            url: "getBookCategoryServlet",--%>
<%--            method: "GET",--%>
<%--            data: {operation: 'category'},--%>
<%--            success: function (data, textStatus, jqXHR) {--%>
<%--                console.log(data);--%>
<%--                let obj = $.parseJSON(data);--%>
<%--                $.each(obj, function (key, value) {--%>
<%--                    $('#category').append('<option value="' + value.id + '">' + value.name + '</option>')--%>
<%--                });--%>
<%--                $('select').formSelect();--%>
<%--            },--%>
<%--            error: function (jqXHR, textStatus, errorThrown) {--%>
<%--                $('#category').append('<option>Category unavailable</option>');--%>
<%--            },--%>
<%--            cache: false--%>
<%--        });--%>


<%--        $('#category').change(function () {--%>
<%--            $('#book').find('option').remove();--%>
<%--            $('#book').append('<option>Select book title</option>');--%>

<%--            let catid = $('#category').val();--%>
<%--            let data = {--%>
<%--                operation: "book",--%>
<%--                id: catid--%>
<%--            };--%>

<%--            $.ajax({--%>
<%--                url: "getBookCategoryServlet",--%>
<%--                method: "GET",--%>
<%--                data: data,--%>
<%--                success: function (data, textStatus, jqXHR) {--%>
<%--                    console.log(data);--%>
<%--                    let obj = $.parseJSON(data);--%>
<%--                    $.each(obj, function (key, value) {--%>
<%--                        $('#book').append('<option value="' + value.id + '">' + value.name + '</option>')--%>
<%--                    });--%>
<%--                    $('select').formSelect();--%>
<%--                },--%>
<%--                error: function (jqXHR, textStatus, errorThrown) {--%>
<%--                    $('#book').append('<option>Book unavailable</option>');--%>
<%--                },--%>
<%--                cache: false--%>
<%--            });--%>
<%--        });--%>

<%--    });--%>
<%--</script>--%>





<%--<script>--%>
<%--    function dynamicdropdown(listindex)--%>
<%--    {--%>
<%--        switch (listindex)--%>
<%--        {--%>
<%--            case "acc" :--%>
<%--                document.getElementById("book").options[0]=new Option("Select book","");--%>
<%--                document.getElementById("book").options[1]=new Option("Everyone Can Buy Property","acc1");--%>
<%--                document.getElementById("book").options[2]=new Option("One Up On Wall Street","acc2");--%>
<%--                break;--%>
<%--            case "bs" :--%>
<%--                document.getElementById("book").options[0]=new Option("Select book","");--%>
<%--                document.getElementById("book").options[1]=new Option("Beyond Entrepreneurship 2.0","bs1");--%>
<%--                document.getElementById("book").options[2]=new Option("The Ride of a Lifetime","bs2");--%>
<%--                break;--%>
<%--            case "comp" :--%>
<%--                document.getElementById("book").options[0]=new Option("Select book","");--%>
<%--                document.getElementById("book").options[1]=new Option("Cloud Native Security","comp1");--%>
<%--                document.getElementById("book").options[2]=new Option("Data Lakes For Dummies","comp2");--%>
<%--                break;--%>
<%--            case "eng" :--%>
<%--                document.getElementById("book").options[0]=new Option("Select book","");--%>
<%--                document.getElementById("book").options[1]=new Option("Think Like An Engineer","eng1");--%>
<%--                document.getElementById("book").options[2]=new Option("How to Invent Everything","eng2");--%>
<%--                break;--%>
<%--        }--%>
<%--        return true;--%>
<%--    }--%>
<%--</script>--%>

</body>
</html>
