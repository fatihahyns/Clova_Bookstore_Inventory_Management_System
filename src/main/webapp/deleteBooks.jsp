<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 27/1/2022
  Time: 2:59 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="cbims.Dao.booksDAO" %>
<%@ page import="cbims.Model.books" %>
<html>
<head>
    <title>Books | Bookstore Inventory Management System</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <link rel="stylesheet" href="assets/bootstrap/css/bootstrap.min.css" />
    <link rel="stylesheet" href="assets/css/main.css" />
    <link rel="stylesheet" href="assets/css/deletemodal.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <noscript><link rel="stylesheet" href="assets/css/noscript.css" /></noscript>
</head>

<body>
<% books bk = new books();%>
<% booksDAO bkdao = new booksDAO();%>

<%--<div class="bkstr-form">--%>
<form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/booksServlet">

    <input type="hidden" name="Action" value="Delete Book" /> <%
    String bid = request.getParameter("id");
    if (!((bid) == null)) {
        int book_ID = Integer.parseInt(bid);
        bk = bkdao.getBookByID(book_ID);
%>

    <input type="hidden" name="id" value="<%=bk.getBook_ID()%>" />
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