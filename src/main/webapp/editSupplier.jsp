<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 27/1/2022
  Time: 2:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Suppliers | Bookstore Inventory Management System</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
</head>
<body>
<%--<div class="bkstr-form">--%>
    <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/suppliersServlet">
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
                <input type="text" class="form-control" name="supplier_Postcode">
            </div>
        </div>


        <div class="form-group">
            <label class="control-label col-sm-4">Address 3 (City):</label>
            <div class="col-sm-12">
                <input type="text" class="form-control" name="supplier_City">
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
                <input type="email" class="form-control"  name="supplier_Email">
            </div>
        </div>

        <%--                            <input type="submit" class="btn btn-primary btn-block mb-4" name="Action" value="Add Supplier">--%>

        <button type="submit" class="btn btn-primary btn-block mb-4" name="Action" value="Update" >UPDATE</button>

    </form>
<%--</div>--%>
</body>
</html>