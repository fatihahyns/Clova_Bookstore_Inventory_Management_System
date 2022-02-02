<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 12/1/2022
  Time: 10:00 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="cbims.Dao.customersDAO" %>
<%@ page import="cbims.Model.customers" %>

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
</head>
<%
    String admin_Name = (String) session.getAttribute("admin_Name");
    if (admin_Name == null)
    { response.sendRedirect("login.jsp")
    ;}
%>

<body>
<% customers cust = new customers(); %>
<% customersDAO custdao = new customersDAO();%>

<form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/customersServlet">

    <input type="hidden" name="Action" value="Delete Customer" /> <%
    String custid = request.getParameter("id");
    if (!((custid) == null)) {
        int customer_ID = Integer.parseInt(custid);
        cust = custdao.getCustomerByID(customer_ID);
%>

    <input type="hidden" name="id" value="<%=cust.getCustomer_ID()%>" />
    <p>Do you really want to delete these records? This process cannot be undone.</p>

    <div class="modal-footer justify-content-center">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
        <button type="submit" class="btn btn-danger">Delete</button>
    </div>
    <%
        } else
            out.println("ID Not Found");
    %>
</form>
<%--</div>--%>
</body>
</html>
