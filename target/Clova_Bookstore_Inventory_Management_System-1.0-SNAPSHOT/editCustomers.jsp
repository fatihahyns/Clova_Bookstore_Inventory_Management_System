<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 3/2/2022
  Time: 2:27 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="cbims.Dao.customersDAO" %>
<%@ page import="cbims.Model.customers" %>
<html>
<head>
    <title>Customer | Bookstore Inventory Management System</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/main.css" />
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
    <input type="hidden" name="Action" value="Update Customer" /> <%
    String custid = request.getParameter("id");
    if (!((custid) == null)) {
        int customer_ID = Integer.parseInt(custid);
        cust = custdao.getCustomerByID(customer_ID);
%>

    <input type="hidden" name="id" value="<%=cust.getCustomer_ID()%>" />

    <div class="form-group">
        <label class="control-label col-sm-4">Full Name:</label>
        <div class="col-sm-12">
            <input type="text" class="form-control"name="customer_Name" value="<%=cust.getCustomer_Name()%>">
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-4">Phone Number:</label>
        <div class="col-sm-12">
            <input type="text" class="form-control"  name="customer_PhoneNo" value="<%=cust.getCustomer_PhoneNo()%>">
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-4">Email:</label>
        <div class="col-sm-12">
            <input type="email" class="form-control" name="customer_Email" value="<%=cust.getCustomer_Email()%>">
        </div>
    </div>

    <button type="submit" class="btn btn-primary btn-block mb-4" value="upd" >UPDATE</button>
    <%
        } else
            out.println("ID Not Found");
    %>
</form>

</body>
</html>
