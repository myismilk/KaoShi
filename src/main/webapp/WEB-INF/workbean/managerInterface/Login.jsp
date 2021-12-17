<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8" />
    <title>登录</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="Content/Common/bootstrap-3.3.2-dist/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="Content/Common/Font-Awesome-3.2.1/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="Content/Styles/style.css" rel="stylesheet" type="text/css" />
    <link href="Content/Common/Styles/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet" type="text/css" />
    <script type="application/javascript" src="jQuery/jquery.js"></script>
    <script type="text/javascript">
        $(function () {
            $("#loginBtn").click(function () {
                $("#hint").html("");
                var username = $.trim($("#username").val());
                var password = $.trim($("#password").val());
                if(username==""||password==""){
                    $("#hint").html("用户名和密码不能为空");
                    return;
                }
                $.ajax({
                    url:"managerLoginVerify",
                    data:{
                        username:username,
                        password:password
                    },
                    type:"post",
                    dataType:"text",
                    success:function (result) {
                        if(result=="true"){
                            window.location.href = "toScManage";
                        }else {
                            $("#hint").html("用户名或密码错误");
                            return;
                        }
                    }
                    
                })
            })





        })



    </script>
    <style type="text/css">
        body {
            background: #F5F5F5;
        }
    </style>
</head>
<body>
    <div class="login-form">
        <form>
            <div class="top">
                <h1>管理端</h1>
                <h4>网络在线考试系统</h4>
            </div>
            <div class="form-area">
                <div class="group">
                    <input type="text" id="username" class="form-control" placeholder="用户名">
                    <i class="fa fa-user"></i>
                </div>
                <div class="group">
                    <input type="password" id="password" class="form-control" placeholder="密码 ">
                    <i class="fa fa-key"></i>
                </div>
                <div class="checkbox checkbox-primary">
                    <input id="checkbox101" type="checkbox" checked>
                    <label for="checkbox101"> 记住我</label>
                </div>
                <label id="hint" type="text" style="color: red"></label>
                <button type="button" id="loginBtn" class="btn btn-default btn-block">登录</button>
            </div>
        </form>
        <div class="footer-links row">
            <div class="col-xs-6"><a href="#"><i class="fa fa-external-link"></i>注册</a></div>
            <div class="col-xs-6 text-right"><a href="#"><i class="fa fa-lock"></i> 忘记密码</a></div>
        </div>
    </div>
</body>
</html>