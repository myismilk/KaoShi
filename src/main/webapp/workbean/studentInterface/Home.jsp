
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>
    </title>
</head>
<frameset rows="20%,85%">
    <frame src="workbean/studentInterface/top.jsp" name="top">
    <frameset cols="15%,85%">
        <frame src="workbean/studentInterface/left.jsp" name="left">
        <frame name="right">
    </frameset>

</frameset>
</html>
