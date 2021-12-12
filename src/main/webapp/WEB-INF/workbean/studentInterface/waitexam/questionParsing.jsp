<%@ page import="com.wangkaiping.domain.Question" %><%--
  Created by IntelliJ IDEA.
  User: 12345678
  Date: 2021/12/2
  Time: 21:30
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
    Question question = (Question) request.getAttribute("question");
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>Title</title>
</head>
<body>
题目：<%=question.getQuestion_topic()%>

</body>
</html>
