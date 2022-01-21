<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 8/1/2022
  Time: 11:43 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>Register | Bookstore Inventory Management System</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    <link rel="stylesheet" type="text/css" href="assets/css/my-login.css">
</head>
<body class="my-login-page">
<section class="h-100">
    <div class="container h-100">
        <div class="row justify-content-md-center h-100">
            <div class="card-wrapper">
                <div class="brand">
                    <img src="images/logo.jpg" alt="bootstrap 4 login page">
                </div>
                <div class="card fat">
                    <div class="card-body">
                        <h4 class="card-title">Register</h4>
                        <form method="post" class="my-login-validation"  action="${pageContext.request.contextPath}/registerServlet">
                            <div class="form-group">
                                <label for="admin_Name">Full Name</label>
                                <input id="admin_Name" type="text" class="form-control" name="admin_Name" required/>
                                   <div class="invalid-feedback">
                                        What's your full name?
                                    </div>
                            </div>
                            <div class="form-group">
                                <label for="admin_Username">Username</label>
                                <input id="admin_Username" type="text" class="form-control" name="admin_Username" required/>
                                    <div class="invalid-feedback">
                                        What's your username?
                                    </div>
                            </div>
                            <div class="form-group">
                                <label for="admin_PhoneNo">Contact No.</label>
                                <input id="admin_PhoneNo" type="text" class="form-control" name="admin_PhoneNo" required>
                                    <div class="invalid-feedback">
                                        What's your contact no?
                                    </div>
                            </div>

                            <div class="form-group">
                                <label for="admin_Email">E-Mail Address</label>
                                <input id="admin_Email" type="email" class="form-control" name="admin_Email" required/>
                                    <div class="invalid-feedback">
                                        Your email is invalid
                                    </div>
                            </div>

                            <div class="form-group">
                                <label for="admin_Password">Password</label>
                                <input id="admin_Password" type="password" class="form-control" name="admin_Password" required/>
                                    <div class="invalid-feedback">
                                        Password is required
                                    </div>
                            </div>

                            <div class="form-group">
                                <div class="custom-checkbox custom-control">
                                    <input type="checkbox" name="agree" id="agree" class="custom-control-input" required=""/>
                                    <label for="agree" class="custom-control-label">I agree to the <a href="#">Terms and Conditions</a></label>
                                        <div class="invalid-feedback">
                                            You must agree with our Terms and Conditions
                                        </div>
                                </div>
                            </div>

                            <div class="form-group m-0">
                                <button type="submit" class="btn btn-primary btn-block" value="submit" >Register</button>
                            </div>
                            <div class="mt-4 text-center">
                                Already have an account? <a href="login.jsp">Login</a>
                            </div>
                        </form>
                    </div>
                </div>
                <div class="footer">
                    Copyright &copy; 2021 &mdash; CLOVA BOOKSTORE
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
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
<script src="js/my-login.js"></script>
</body>
</html>
