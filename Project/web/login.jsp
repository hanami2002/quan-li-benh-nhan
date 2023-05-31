<%-- 
    Document   : login
    Created on : May 20, 2023, 3:48:50 PM
    Author     : Hanami
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://netdna.bootstrapcdn.com/bootstrap/3.1.0/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-1.11.1.min.js"></script>
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.1.0/js/bootstrap.min.js"></script>
<style>
.cover {
     width: 400px;
    margin: auto;
    margin-top: 10%;
}
.mastfoot {
    padding-top: 0px;
    text-align: center;
    margin: auto;
}
</style>

</head>
<body>
<div class="cover-container">
    <div class="masthead clearfix">
        <div class="inner">
            <h3 class="masthead-brand"></h3>
            <ul class="nav masthead-nav">
                <!--<li class="active"><a href="#">Home</a></li>
                <li><a href="#">Features</a></li>
                <li><a href="#">Contact</a></li>-->
            </ul>
        </div>
    </div>
    <div class="inner cover">
        <div class="panel panel-default">
            
            <div class="panel-body">
                <!-- tabs -->
                <ul id="dTab" class="nav nav-tabs">
                    <li class="active"><a href="#pane1" data-toggle="tab">Bác Sĩ</a></li>
                    <li><a href="#pane2" data-toggle="tab">Bệnh Nhân</a></li>
                    <!--<li><a href="#pane3" data-toggle="tab"></a></li>-->
                </ul>
                <div class="tab-content">
                    <div id="pane1" class="tab-pane fade in active">
                        <!-- Register Username -->
                        <form action="login" method="POST">
                                <div class="form-group">
                                <label for="exampleInputEmail1">Tên Đăng Nhập</label>
                                <input name="username" type="text" class="form-control" id="exampleInputEmail1" placeholder="Enter email" />
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Mật Khẩu</label>
                                <input  name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" />
                            </div>
                            <button type="submit" class="btn btn-primary">Đăng Nhập</button>

                            <button type="reset" class="btn btn-primary" id="forgetBtn2">Quên mật khẩu?</button>
                        </form>
                    </div>
                    <div id="pane2" class="tab-pane fade">
                        <!-- login -->
                        <form  action="login" method="POST">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Tên Đăng Nhập</label>
                                <input name="username" type="text" class="form-control" id="exampleInputEmail1" placeholder="Enter email" />
                            </div>
                            <div class="form-group">
                                <label for="exampleInputPassword1">Mật Khẩu</label>
                                <input name="password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password" />
                            </div>
                            <button type="submit" class="btn btn-primary">Đăng Nhập</button>

                            <button type="reset" class="btn btn-primary" id="forgetBtn1">Quên mật khẩu?</button>
                        </form>
                        <!-- login-ends-->
                    </div>
                    <div id="pane3" class="tab-pane fade">
                        <!-- password forget -->
                        <form role="form" action="" method="POST">
                            <div class="form-group">
                                <label for="exampleInputEmail1">Email </label>
                                <input type="email"  class="form-control" id="exampleInputEmail1" placeholder="Request a password reset. Enter your email" />
                            </div>

                            <button type="submit" class="btn btn-primary">Reset Password</button>
                            <button type="reset" class="btn btn-primary" id="loginBtn">Login</button>
                        </form>
                        <!-- password forget -->
                    </div>
                </div>
                <!-- -->
            </div>
        </div>
        
    </div>
</div>
<script>
$(document).ready(function () {
    $("#forgetBtn1").click(function () {
        $("#dTab li:eq(2) a").tab("show");
        $(".tab-content div.active").removeClass("active in");
        $(".tab-content").find("#pane3").addClass("active in");
    });
    $("#forgetBtn2").click(function () {
        $("#dTab li:eq(2) a").tab("show");
        $(".tab-content div.active").removeClass("active in");
        $(".tab-content").find("#pane3").addClass("active in");
    });
     $("#loginBtn").click(function () {
        $("#dTab li:eq(1) a").tab("show");
        $(".tab-content div.active").removeClass("active in");
        $(".tab-content").find("#pane2").addClass("active in");       
    });    
});
</script>

</body>
</html>
