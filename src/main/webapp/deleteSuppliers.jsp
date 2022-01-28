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
<html>
<head>
    <title>Suppliers | Bookstore Inventory Management System</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <link rel="stylesheet" href="assets/css/deletemodal.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
</head>

<body>
<% suppliers sp = new suppliers(); %>
<% suppliersDAO spdao = new suppliersDAO(); %>

<form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/suppliersServlet">

    <input type="hidden" name="Action" value="Delete Supplier" /> <%
    String sid = request.getParameter("id");
    if (!((sid) == null)) {
        int supplier_ID = Integer.parseInt(sid);
        sp = spdao.getSupplierByID(supplier_ID);
%>

    <input type="hidden" name="id" value="<%=sp.getSupplier_ID()%>" />
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
</body>
</html>