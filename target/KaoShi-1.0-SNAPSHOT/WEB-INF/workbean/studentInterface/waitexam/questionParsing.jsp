<%@ page import="com.wangkaiping.domain.Question" %>
<%@ page import="com.wangkaiping.domain.Comment" %>
<%@ page import="java.util.List" %>
<%@ page import="com.wangkaiping.vo.CommentVo" %><%--
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
    //题目
    Question question = (Question) request.getAttribute("question");

    //Student选项
    String userAnswer = (String) request.getAttribute("userAnswer");

    //该题目的评论
    List<CommentVo> commentVoList = (List<CommentVo>) request.getAttribute("commentVoList");

%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>Title</title>
    <style type="text/css">
        .option{
            font-size: 18px;
            margin-top: 10px;
        }
    </style>
</head>
<script type="application/javascript" src="jQuery/jquery.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
<body>
<div style="width: 100%;font-size:30px">
    题目详情：
</div>
<div style="width: 100%">
    <div style="font-size: 30px">题目：<%=question.getQuestion_topic()%></div>
    <div class="option">A.<%=question.getQuestion_A()%></div>
    <div class="option">B.<%=question.getQuestion_B()%></div>
    <div class="option">C.<%=question.getQuestion_C()%></div>
    <div class="option">D.<%=question.getQuestion_D()%></div>
</div>
<div style="margin-top: 15px">
    <span style="font-size: 15px">正确答案：<%=question.getAnswer()%></span>
    <span style="font-size: 15px;margin-left: 100px">你的答案：<%=userAnswer%></span>
</div>

<div style="margin-top: 60px">

    <span style="font-size: 20px">试题解析：</span>
    <p style="color: darkgray;font-size: 25px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;暂无解析</p>

</div>

<!--评论-->
<div>
    <span style="font-size: 20px">评论区</span>
</div>
<%
    for(CommentVo commentVo:commentVoList){
%>
<div style="width:80%;margin-top: 30px;margin-left: 20px">
    <span><%=commentVo.getCommentStudent()%></span><span>（<%=commentVo.getCommentCreateTime()%>）</span>
    <p style="margin-top: 10px">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=commentVo.getCommentContent()%></p>
</div>
<%
    }
%>
</body>
</html>
