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
    int index = 0;
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>Title</title>
<link rel="stylesheet" href="font-awsome/font-awesome-4.7.0/css/font-awesome.min.css">
</head>
<script type="application/javascript" src="jQuery/jquery.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
<script type="text/javascript">
    $(function () {
        var data = [{id:1,name:"wangkaiping",address:"guangdong"},{id:2,name:"haha",address:"beijing"},{id:1,name:"hehexi",address:"shanghai"},]
        var index = 0;
        $("#btn").click(function () {
            alert(data[index].name);
            index = index + 1;
        })
        $("#selfModal").modal("show");
    })

</script>
<%--<script>
    var file = document.querySelector('#file')
    file.onchange = function (){
        alert(file.value)
    }
</script>--%>

<i class="fa fa-address-book" aria-hidden="true"></i>
<body>

<form>




</form>
</body>
</html>
