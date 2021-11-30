<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.File" %><%--
  Created by IntelliJ IDEA.
  User: 12345678
  Date: 2021/11/23
  Time: 21:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
    File file = new File("");
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>Title</title>
</head>
<script type="application/javascript" src="jQuery/jquery.js"></script>
<script type="text/javascript">


</script>
<body>
<input type="file" name="file" id="file">

<script>
    var file = document.querySelector('#file')
    file.onchange = function (){
        alert(file.value)
    }
</script>
</body>
</html>
