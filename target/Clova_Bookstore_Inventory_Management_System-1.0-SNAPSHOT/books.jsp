<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 8/1/2022
  Time: 10:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="cbims.DBConnect.DBConnection"%>
<%@page import="cbims.Model.books"%>
<%@page import="cbims.Dao.booksDAO"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>

<html>
<head>
    <title>Books | Bookstore Inventory Management System</title>
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

            <li><a href="books.jsp" class="active">Books</a></li>

            <li><a href="category.jsp">Category</a></li>

            <li><a href="suppliers.jsp">Suppliers</a></li>

            <li><a href="customers.jsp">Customers</a></li>

            <li><a href="orders.jsp">Orders</a></li>


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
            <h1>Books</h1>

            <!-- Tabs navs -->
            <ul class="nav nav-tabs mb-3" id="myTab">
                <li class="nav-item">
                    <a
                            class="nav-link active"
                            data-bs-toggle="tab"
                            href="#add-books"
                    >Add Books</a
                    >
                </li>
                <li class="nav-item">
                    <a
                            class="nav-link"
                            data-bs-toggle="tab"
                            href="#list-books"
                    >List of Books</a
                    >
                </li>
            </ul>
            <!-- Tabs navs -->

            <!-- Tabs content -->
            <div class="tab-content">
                <div
                        class="tab-pane fade show active"
                        id="add-books">

                    <div class="bkstr-form">
                        <form class="form-horizontal" method="post" action="${pageContext.request.contextPath}/booksServlet">

                            <div class="form-group">
                                <label class="control-label col-sm-4">Book Category:</label>
                                <div class="col-sm-12">
                                    <select class="form-control" name="category_ID">
                                        <%
                                            Connection con = DBConnection.getConn();
                                            Statement st = con.createStatement();
                                            ResultSet rs = st.executeQuery("SELECT * FROM category order by category_Name");
                                            while (rs.next()){
                                        %>
                                            <option value="<%=rs.getInt("category_ID") %>"><%=rs.getString("category_Name") %></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-4">Book Title:</label>
                                <div class="col-sm-12">
                                    <input type="text" class="form-control" name="book_Title">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-4">Author Name:</label>
                                <div class="col-sm-12">
                                    <input type="text" class="form-control"name="book_AuthorName">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-4">Book Description:</label>
                                <div class="col-sm-12">
                                    <textarea class="form-control"  name="book_Description" rows="5"></textarea>
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="control-label col-sm-4">Price:</label>
                                <div class="col-sm-12">
                                    <input type="text" class="form-control" name="book_Price">
                                </div>
                            </div>


                            <div class="form-group">
                                <label class="control-label col-sm-4">No of Stocks:</label>
                                <div class="col-sm-12">
                                    <input type="text" class="form-control"  name="book_NoOfStocks">
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="control-label col-sm-4">Supplier:</label>
                                <div class="col-sm-12">
                                    <select class="form-control" name="supplier_ID">
                                        <%
                                            Statement st2 = con.createStatement();
                                            ResultSet rs2 = st2.executeQuery("SELECT * FROM supplier order by supplier_Name");
                                            while (rs2.next()){
                                        %>
                                        <option value="<%=rs2.getInt("supplier_ID") %>"><%=rs2.getString("supplier_Name") %></option>
                                        <%
                                            }
                                        %>
                                    </select>
                                </div>
                            </div>

                            <button type="submit" class="btn btn-primary btn-block mb-4" name="Action" value="Add Book" >SUBMIT</button>

                        </form>
                    </div>
                </div>

                <div class="tab-pane fade" id="list-books">

<%--                    search book--%>
    <form class="form-horizontal" method="get">
        <div class="form-row align-items-center">
            <div class="col-sm-11 my-1">
                <input type="input" class="form-control" name="searchdata" placeholder="Search title / author / category / supplier...">
            </div>


            <div class="col-auto my-1">
                <button type="submit" class="btn btn-primary">SEARCH</button>
            </div>
        </div>
    </form>
    <br>
<%--                    list book--%>
                    <table class="table table-bordered table-hover table-condensed">
                        <thead class="thead-dark">
                        <tr>
                            <th class="text-center" scope="col">No.</th>
                            <th class="text-center" scope="col">Title</th>
                            <th class="text-center" scope="col">Author</th>
                            <th class="text-center" scope="col">Description</th>
                            <th class="text-center" scope="col">Price</th>
                            <th class="text-center" scope="col">Category</th>
                            <th class="text-center" scope="col">Supplier</th>
                            <th class="text-center" scope="col">No of Stocks</th>
                            <th class="text-center" scope="col">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                            <%
                                Statement st3 = con.createStatement();
                                String search = request.getParameter("searchdata");
                                String sql;

                                if(search != null){
                                    sql = "SELECT bk.*, cat.*, sp.* FROM book bk, category cat, supplier sp WHERE (bk.book_Title like '%"+search+"%' OR bk.book_AuthorName like '%"+search+"%' OR cat.category_Name like '%"+search+"%' OR sp.supplier_Name like '%"+search+"%') AND cat.category_ID = bk.category_ID AND bk.supplier_ID = sp.supplier_ID";


                                }else{
                                    sql = "SELECT bk.*, cat.*, sp.* FROM book bk, category cat, supplier sp WHERE cat.category_ID = bk.category_ID AND bk.supplier_ID = sp.supplier_ID";
                                }

                                ResultSet rs3 = st3.executeQuery(sql);
                                int i=1;
                                while (rs3.next()){

                        %>
                            <tr>
                                <th class="text-center" scope="row"><%=i%></th>
                                <td align="center"><%=rs3.getString("book_Title") %></td>
                                <td align="center"><%=rs3.getString("book_AuthorName") %></td>
                                <td align="center"><%=rs3.getString("book_Description") %></td>
                                <td align="center">RM <%=rs3.getString("book_Price") %></td>
                                <td align="center"><%=rs3.getString("category_Name") %></td>
                                <td align="center"><%=rs3.getString("supplier_Name") %></td>
                                <td align="center"><%=rs3.getString("book_NoOfStocks") %></td>

                                <td align="center" class="col-2">
                                    <button type="button" data-toggle="modal" data-target="#updateBook" id="<%=rs3.getInt("book_ID") %>" class="btn btn-success btn-sm rounded-0"><i class="material-icons" title="Edit">&#xE254;</i></button>
                                    <button type="button" data-toggle="modal" data-target="#deleteBook" id="<%=rs3.getInt("book_ID") %>" class="del btn btn-danger btn-sm rounded-0"><i class="material-icons" title="Delete">&#xE872;</i></button>
                                </td>
                            </tr>
                                <%
                                i++;
                            }
                        %>
                        </tbody>
                    </table>

                </div>
            </div>
            <!-- Tabs content -->

            <!-- Update Pop up -->
            <div class="modal fade" id="updateBook" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                <div class="modal-dialog modal-lg" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title" id="exampleModalLabel">Edit Book</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span></button>
                        </div>
                        <div class="modal-body">
                            <div id="show-data"></div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Update Pop up -->

            <!-- Delete Pop up -->
            <div class="modal fade" id="deleteBook" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel2" aria-hidden="true">
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

<script type="text/javascript">
    $(document).ready(function (){
        $('.btn-success').click(function(){
            var id = +this.id;
            $.ajax({
                url: "editBooks.jsp",
                type:"post",
                data:{
                    id: id,
                },
                success:function (data){
                    $("#show-data").html(data);
                }
            });
        });
    });
</script>

<script type="text/javascript">
    $(document).ready(function (){
        $('.del').click(function(){
            var id = +this.id;
            $.ajax({
                url: "deleteBooks.jsp",
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
<!-- Scripts -->
</body>
</html>
