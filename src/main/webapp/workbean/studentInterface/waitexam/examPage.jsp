<%@ page import="com.wangkaiping.domain.Question" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: 12345678
  Date: 2021/11/22
  Time: 13:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
List<Question> questionList = (List<Question>) request.getAttribute("questionList");
int index = 0;
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>考试界面</title>
</head>
<!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
<script type="application/javascript" src="jQuery/jquery.js"></script>
<script type="application/javascript">
    $(function (){
        var exam = "";

        $.ajax({
            url:"studentInterface/getExam.do",
            data:{


            },
            type:"get",
            dataType:"json",
            success:function (result) {
                exam=result;
            }
        })


        $("#submitBtn").click(function (){
            /*$("input[name="+radioName+"]:checked").val()*/
            var param = ""
            var result = false
            var i = 1;
            <%
            for (Question question:questionList){
            %>
            param += "<%=question.getQuestion_id()%>="+$("input[name=<%=question.getQuestion_id()%>]:checked").val()
               if($("input[name=<%=question.getQuestion_id()%>]:checked").val()===undefined){
                   param += "<%=question.getQuestion_id()%>=null"
                   result = true;
               }
               if(i < <%=questionList.size()%>){
                   param += "&";
                   i += 1
               }
            <%
            }
            %>
            if(result){
                if(confirm("你有题未作答是否提交试卷")){
                    window.onbeforeunload = undefined
                    window.location.href = 'workbean/studentInterface/waitexam/scoring.do?' + param;
                }
            }else {
                if(confirm("是否提交试卷")) {
                    window.onbeforeunload = undefined
                    window.location.href = 'workbean/studentInterface/waitexam/scoring.do?' + param;
                }
            }
        })
        window.onbeforeunload = function (event){
            event.returnValue = "退出数据不会保存，你确定要退出吗？";
        }
    })
</script>
<body>
<form>
<%
    for(Question question:questionList){
        index += 1;
%>
<div class="list-group" style="margin-left: 20px">
        <h4 class="list-group-item-heading" style="margin-top: 20px">第<%=index%>题：<%=question.getQuestion_topic()%></h4>
        <p class="list-group-item-text" style="margin-top: 30px;margin-bottom: 60px;font-size: 15px">
            <input style="margin-left: 40px;width: 15px;height: 15px" type="radio" name="<%=question.getQuestion_id()%>" value="A">A、<%=question.getQuestion_A()%>
            <input style="margin-left: 40px;width: 15px;height: 15px" type="radio" name="<%=question.getQuestion_id()%>" value="B">B、<%=question.getQuestion_B()%>
            <input style="margin-left: 40px;width: 15px;height: 15px" type="radio" name="<%=question.getQuestion_id()%>"value="C">C、<%=question.getQuestion_C()%>
            <input style="margin-left: 40px;width: 15px;height: 15px" type="radio" name="<%=question.getQuestion_id()%>" value="D">D、<%=question.getQuestion_D()%>
        </p>
</div>
<%
    }
%>
    <input id="submitBtn" style="width: 100px;height: 40px;border-radius: 5%;margin-left: 45%;margin-top: 40px" type="button" value="提交答卷">
</form>
</body>
</html>