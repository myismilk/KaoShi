<%--
  Created by IntelliJ IDEA.
  User: 12345678
  Date: 2021/10/21
  Time: 15:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>Title</title>
    <style>
        .bg{
            transform: translate(-50%,-50%);
            /*margin: 0 auto;*/
            position: absolute;
            left: 50%;
            top:50%;
        }
    </style>
</head>
<body style="background-color: steelblue">
<div style="float: left;display: block;width: 550px">
<p style="text-align: left;font-size: 40px;color: black;margin-top: 20px;font-family:'KaiTi_GB2312';margin: 40px 0 0 20px">欢迎登录****考试管理系统</p>

</div>
<img src="image/studentInterface/logo/logo1.jpg" class="bg">
<div style="float: right;height: 50px;width: 150px">
    用户：
</div>
</body>
</html>
