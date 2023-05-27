<%-- 
    Document   : login
    Created on : May 20, 2023, 3:48:50 PM
    Author     : Hanami
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Login Form</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    </head>
    <body>

        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header">
                            <h4>Login</h4>
                        </div>
                        <div class="card-body">
                            <form action="login" method="post">
                                <div class="form-group">
                                    <label for="username">Username:</label>
                                    <input type="text" class="form-control" name="username" id="username" placeholder="Enter your username">
                                </div>
                                <div class="form-group">
                                    <label for="password">Password:</label>
                                    <input type="password" class="form-control" name="password" id="password" placeholder="Enter your password">
                                </div>
                                <div class="form-group">
                                    <label for="message">${message}</label>
                                    
                                </div>
                                <div class="form-group">
                                    <div class="">
                                        <div class="row">
                                            <div class="col-md-6">
                                                <button type="subbmit" id="myButton"  class="btn btn-primary">Login</button>

                                                <button type="button" id="myButton" class="btn btn-primary">Register</button>
                                            </div>
                                            <div class="col-md-6 text-right">
                                                <button type="button"id="myButton"  class="btn btn-primary">Forgot Password?</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <script>
            var button = document.getElementById("myButton");

            button.addEventListener("mouseover", function () {
                button.style.backgroundColor = "blue";
            });

            button.addEventListener("mouseout", function () {
                button.style.backgroundColor = ""; // Khôi phục màu nền gốc
            });

        </script>
        <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    </body>
</html>


