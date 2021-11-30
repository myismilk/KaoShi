<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>

<head>

    <base href="<%=basePath%>">
    <title>考试系统登录界面</title>
    <link rel="stylesheet" type="text/css" href="css/Login.css">
</head>
<body>
<div id="LoginBackage">
<div id="loginDiv">
    <form action="workbean/studentInterface/Home.jsp" id="form">
        <h1 style="text-align: center;color: pink;">欢迎来到****考试管理系统</h1>
        <div style="text-align: center;margin-top: 30px;">
            <p><span class="p1">用户名</span><input id="userNname" type="text" name="userName"><label id="name_trip"></label></p>
            <p><span class="p1">密码</span><input id="password" type="password" name="password"><label id="password_trip"></label></p>
            <input type="radio" name="identify" value="0">学生<input type="radio" name="identify" value="1">管理员<br/>
            <input type="submit" class="button"  value="登陆">
            <input type="reset" class="button" value="重置">
            <img src="image/LoginBackGround.jpg"/>
        </div>
    </form>
</div>
</div>
</body>
</html>
