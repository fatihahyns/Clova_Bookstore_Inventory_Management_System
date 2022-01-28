<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 27/1/2022
  Time: 2:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="cbims.Dao.categoryDAO" %>
<%@ page import="cbims.Model.category" %>
<html>
<head>
    <title>Category | Bookstore Inventory Management System</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
</head>
<body>
<% category cat = new category(); %>
<% categoryDAO catdao = new categoryDAO();%>


<form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/categoryServlet">

    <input type="hidden" name="Action" value="Update Category" /> <%
    String cid = request.getParameter("id");
    if (!((cid) == null)) {
        int category_ID = Integer.parseInt(cid);
        cat = catdao.getCategoryByID(category_ID);
%>

    <input type="hidden" name="id" value="<%=cat.getCategory_ID()%>" />

    <div class="form-group">
        <label class="control-label col-sm-4">Category Name:</label>
        <div class="col-sm-12">
            <input type="text" class="form-control" name="category_Name" value="<%=cat.getCategory_Name()%>">
        </div>
    </div>

    <div class="form-group">
        <label class="control-label col-sm-4">No. of Books:</label>
        <div class="col-sm-12">
            <input type="text" class="form-control"  name="category_NoOfBooks" value="<%=cat.getCategory_NoOfBooks()%>">
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