<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 8/1/2022
  Time: 11:39 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Login | Bookstore Inventory Management System</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="assets/css/my-login.css">
</head>
<body class="my-login-page">
<section class="h-100">
    <div class="container h-100">
        <div class="row justify-content-md-center h-100">
            <div class="card-wrapper">
                <div class="brand">
                    <img src="images/logo.jpg" alt="logo">
                </div>
                <div class="card fat">
                    <div class="card-body">
                        <h4 class="card-title">Login</h4>
                        <form method="post" class="my-login-validation" novalidate="" action="${pageContext.request.contextPath}/loginServlet">
                            <div class="form-group">
                                <label for="admin_Username">Username</label>
                                <input id="admin_Username" type="text" class="form-control" name="admin_Username" required>
                                    <div class="invalid-feedback">
                                        Username is invalid
                                    </div>
                            </div>

                            <div class="form-group">
                                <label for="admin_Password">Password
                                    <a href="#" class="float-right">
                                        Forgot Password?
                                    </a>
                                </label>
                                <input id="admin_Password" type="password" class="form-control" name="admin_Password" required>
                                    <div class="invalid-feedback">
                                        Password is required
                                    </div>
                            </div>

                            <div class="form-group">
                                <div class="custom-checkbox custom-control">
                                    <input type="checkbox" name="remember" id="remember" class="custom-control-input">
                                    <label for="remember" class="custom-control-label">Remember Me</label>
                                </div>
                            </div>

                            <div class="form-group m-0">
                                <button type="submit" class="btn btn-primary btn-block" value="submit" >Login</button>
                            </div>
                            <div class="mt-4 text-center">
                                Don't have an account? <a href="register.jsp">Create One</a>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="footer">
                    Copyright &copy; 2021 &mdash; CLOVA Bookstore
                </div>
            </div>
        </div>
    </div>
</section>

<script>
    $("#form").submit(function() {
        var requiredFailed = true;
        $("#form input:text").each(function() {
            if ($.trim($(this).val()).length == 0) {
                requiredFailed = false;
                return false;
            }
        });
        return requiredFailed;
    });
</script>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="js/my-login.js"></script>

</body>
</html>
