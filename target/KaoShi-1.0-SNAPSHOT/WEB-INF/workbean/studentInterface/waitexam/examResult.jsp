<%@ page import="java.util.Map" %>
<%@ page import="com.wangkaiping.domain.Question" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.Set" %>
<%@ page import="java.util.Iterator" %>
<%@ page import="com.wangkaiping.vo.AnswerSheet" %><%--
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
    Map<Integer,AnswerSheet> answerSheetMap = (Map<Integer, AnswerSheet>) request.getAttribute("answerSheetMap");
    int i = 1;
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>Title</title>
</head>
<script type="application/javascript" src="jQuery/jquery.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
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
        AnswerSheet answerSheet = answerSheetMap.get(question.getQuestion_id());
%>
<div style="margin-top: 50px">
<div style="float: left;width: 450px">
第<%=i%>题：<%
    if (answerSheet.getUserAnswer().equals(answerSheet.getOptionAnswer())){
%>
<span style="color: green;font-size: 30px">√</span> 你的选项：<%=answerSheet.getUserAnswer()%>  答案：<%=answerSheet.getOptionAnswer()%>
</div>
<a class="btn btn-default" style="color: darkseagreen" href="workbean/studentInterface/waitexam/getQuestionDetails?questionId=<%=question.getQuestion_id()%>&userAnswer=<%=answerSheet.getUserAnswer()%>">查看题目解析</a>
</div>
<%
    }else {
%>
<span style="color: red;font-size: 30px">×</span>你的选项：<%=answerSheet.getUserAnswer()%>  答案：<%=answerSheet.getOptionAnswer()%>
</div>
<a class="btn btn-default" style="color: darkseagreen" href="workbean/studentInterface/waitexam/getQuestionDetails?questionId=<%=question.getQuestion_id()%>&userAnswer=<%=answerSheet.getUserAnswer()%>">查看题目解析</a>
</div>
<%
    }
%>
<%
    i += 1;
    }
%>




</body>
</html>
