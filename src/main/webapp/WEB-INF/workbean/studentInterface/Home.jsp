
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>考试管理系统</title>
    <link rel="icon" href="image/icon/favicon.ico">
</head>

<frameset rows="20%,85%">
    <frame src="top" name="top">
    <frameset cols="15%,85%">
        <frame src="left" name="left">
        <frame src="workbean/self/studentMessage.do" name="right">
    </frameset>

</frameset>
</html>
