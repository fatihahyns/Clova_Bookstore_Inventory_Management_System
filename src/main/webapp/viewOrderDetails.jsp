<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 27/1/2022
  Time: 2:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="cbims.Dao.suppliersDAO" %>
<%@ page import="cbims.Model.suppliers" %>
<%@ page import="cbims.Dao.ordersDAO" %>
<%@ page import="cbims.Model.orders" %>
<%@ page import="java.text.DecimalFormat" %>
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
        .order-table .table thead th { background-color:#fff; font-size:13px; padding:8px 5px 5px; border-bottom:1px solid #ddd; }
        .order-table .table td { font-size:13px; padding:8px 5px 5px; }
    </style>
</head>
<%
    String admin_Name = (String) session.getAttribute("admin_Name");
    if (admin_Name == null)
    { response.sendRedirect("login.jsp")
    ;}
%>
<body>
<% orders od = new orders(); %>
<% ordersDAO odao = new ordersDAO(); %>

 <%
     DecimalFormat df = new DecimalFormat("##. 00");
    String oid = request.getParameter("id");
    if (!((oid) == null)) {
        int orderNo = Integer.parseInt(oid);
        od = odao.getOrderByOrderNo(orderNo);
%>

<div class="table-responsive-sm order-table">
    <table class="table table-borderless text-center">
        <tr>
            <td class="text-left">
                <h3 class="font-15 xs-font-13">Sold to:</h3>
                <p class="no-margin font-15"><%=od.getCustomer_Name()%></p>
            </td>
            <td class="text-left">
                <h3 class="font-15 xs-font-13">Order:</h3>
                <p class="no-margin font-15">
                    <b>Order number: </b>#<%=od.getOrder_No()%><br>
                    <b>Order date: </b><%=od.getOrder_DateTime()%><br>
                </p>
            </td>
        </tr>
        <tr>
            <td class="text-left">
                <h3 class="font-15 xs-font-13">Shop:</h3>
                <p class="font-15">Clova Bookstore</p>
            </td>
        </tr>
    </table>
</div>

<div class="table-responsive-sm order-table">
    <table class="bg-white table table-bordered text-center border border-2 border-dark">
        <thead>
        <tr>
            <th class="text-center">Item</th>
            <th class="text-center">Price</th>
            <th class="text-center">Qty</th>
            <th class="text-center">Subtotal</th>
        </tr>
        </thead>
        <tbody>
        <tr>
            <td class="text-center">
                <%=od.getBook_Title()%><br>
                <small>
                    <span class="text-muted">ISBN: </span><%=od.getBook_ISBN()%>
                </small>
            </td>
            <td class="text-center">RM <%=df.format(od.getOrderDetails_Price())%></td>
            <td class="text-center"><%=od.getOrderDetails_Quantity()%></td>
            <td class="text-center">RM <%=df.format(od.getOrderDetails_TotalPrice())%></td>
        </tr>

        </tbody>
        <tfoot class="font-weight-600">
        <tr>
            <td colspan="3" class="text-right">Total</td>
            <td>RM <%=df.format(od.getOrderDetails_TotalPrice())%></td>
        </tr>
        </tfoot>
    </table>
</div>
<%
    } else
        out.println("Order No Not Found");
%>
</body>
</html>