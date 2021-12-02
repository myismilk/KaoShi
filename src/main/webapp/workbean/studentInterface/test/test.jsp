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
</head>
<script type="application/javascript" src="jQuery/jquery.js"></script>
<script type="text/javascript">
    $(function () {
        var data = [{id:1,name:"wangkaiping",address:"guangdong"},{id:2,name:"haha",address:"beijing"},{id:1,name:"hehexi",address:"shanghai"},]
        var index = 0;
        $("#btn").click(function () {
            alert(data[index].name);
            index = index + 1;
        })
    })

</script>
<%--<script>
    var file = document.querySelector('#file')
    file.onchange = function (){
        alert(file.value)
    }
</script>--%>
<body>
<input type="button"  id="btn" value="提交">

</body>
</html>
