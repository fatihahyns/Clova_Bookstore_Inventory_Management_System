<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 6/2/2022
  Time: 6:59 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="cbims.Dao.orderdetailsDAO" %>
<%@ page import="cbims.Model.orderdetails" %>
<html>
<head>
    <title>Remove from Cart | Bookstore Inventory Management System</title>
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
<% orderdetails od = new orderdetails(); %>
<% orderdetailsDAO oddao = new orderdetailsDAO();%>

<form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/orderdetailsServlet">

    <input type="hidden" name="Action" value="Remove from Cart" /> <%
    String cid = request.getParameter("id");
    if (!((cid) == null)) {
        od = oddao.getItemByBookID(cid);
%>

    <input type="hidden" name="id" value="<%=od.getBook_ID()%>" />
    <p>Are you sure you would like to remove this item from the cart?</p>

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