<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <base href="<%=basePath%>">
    <title>Title</title>
</head>
<body>
<form action="toEditQuestion" method="post">
    <input name="a" value="饿呢呢嗯嗯嗯嗯讷讷">
    <input type="submit" value="提交">
</form>

</body>
</html>
