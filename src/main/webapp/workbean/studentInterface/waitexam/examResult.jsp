<%@ page import="java.util.Map" %>
<%@ page import="com.wangkaiping.domain.Question" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 12345678
  Date: 2021/11/22
  Time: 20:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
    List<Question> questionList = (List<Question>) session.getAttribute("questionList");
    int fraction = (int) request.getAttribute("fraction");
    Map<Integer,Boolean> resultMap = (Map<Integer, Boolean>) request.getAttribute("resultMap");
    int i = 1;
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>Title</title>
</head>
<script type="application/javascript" src="jQuery/jquery.js"></script>
<script type="application/javascript">
    $(function (){
        if (80 <= <%=fraction%>){
            $("#fraction").css("color","green");
        }else if (60 <= (<%=fraction%>) && (<%=fraction%>) < 80){
            $("#fraction").css("color","burlywood");
    }else {
            $("#fraction").css("color","red");
        }

    })

</script>
<body>
本次考试获得分数：<span id="fraction" style="font-size: 50px"><%=fraction%></span><br>
<%
    for(Question question:questionList){
%>
第<%=i%>题：<%
    boolean result = resultMap.get(question.getQuestion_id());
    if (result){
%>
<span style="color: green">√</span><br>
<%
    }else {
%>
<span style="color: red">×</span><br>
<%
    }
%>
<%
    i += 1;
    }
%>




</body>
</html>