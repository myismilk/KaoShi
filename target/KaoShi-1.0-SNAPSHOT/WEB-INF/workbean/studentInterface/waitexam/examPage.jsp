<%@ page import="com.wangkaiping.domain.Question" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
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
ArrayList<Question> questionList = (ArrayList<Question>) request.getAttribute("questionList");
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
    var topicNumber = 1;
    //试卷的json对象
    /*var exam = ;
    topicNumber = 1;
    $("#topicNumber").text(topicNumber)
    $("#topic").text(exam[topicNumber].topic)
    $("#optionA").text(exam[topicNumber].optionA)
    $("#optionB").text(exam[topicNumber].optionB)
    $("#optionC").text(exam[topicNumber].optionC)
    $("#optionD").text(exam[topicNumber].optionD)*/
    /*function next() {
        topicNumber = topicNumber + 1;

    }
    function previous() {
        topicNumber = topicNumber - 1;
    }*/


    $(function (){
        $("#"+topicNumber).show();
        $("#current").text(topicNumber);
        $("#submitBtn").click(function (){
            var param = "";
            var result = false;
            var i = 1;
            <%
            for (Question question:questionList){
            %>
            param += "<%=question.getQuestion_id()%>="+$("input[name=<%=question.getQuestion_id()%>]:checked").val()
            if($("input[name=<%=question.getQuestion_id()%>]:checked").val()===undefined){
                param += "<%=question.getQuestion_id()%>=null";
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
                    window.onbeforeunload = undefined;
                    window.location.href = 'workbean/studentInterface/waitexam/scoring.do?' + param;
                }else{
                    return;
                }
            }else {
                if(confirm("是否提交试卷")) {
                    window.onbeforeunload = undefined;
                    window.location.href = 'workbean/studentInterface/waitexam/scoring.do?' + param;
                }else {
                    return;
                }
            }
        })

        $("#next").click(function () {
            if(topicNumber==10){
                var param = "";
                var result = false;
                var i = 1;
                <%
                for (Question question:questionList){
                %>
                param += "<%=question.getQuestion_id()%>="+$("input[name=<%=question.getQuestion_id()%>]:checked").val()
                if($("input[name=<%=question.getQuestion_id()%>]:checked").val()===undefined){
                    param += "<%=question.getQuestion_id()%>=null";
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
                        window.onbeforeunload = undefined;
                        window.location.href = 'workbean/studentInterface/waitexam/scoring.do?' + param;
                    }else {
                        return
                    }
                }else {
                    if(confirm("题目已做完，是否提交试卷")) {
                        window.onbeforeunload = undefined;
                        window.location.href = 'workbean/studentInterface/waitexam/scoring.do?' + param;
                    }else {
                        return;
                    }
                }
            }
            $("#"+topicNumber).hide();
            topicNumber = topicNumber + 1;
            $("#current").text(topicNumber);
            $("#"+topicNumber).show();

            //alert(exam[topicNumber].topic);
            /*$("#topicNumber").text(topicNumber)
            $("#topic").text(exam[topicNumber].topic)
            $("#optionA").text(exam[topicNumber].optionA)
            $("#optionB").text(exam[topicNumber].optionB)
            $("#optionC").text(exam[topicNumber].optionC)
            $("#optionD").text(exam[topicNumber].optionD)*/
        })

        $("#previous").click(function () {
            if(topicNumber==1){
                return;
            }
            $("#"+topicNumber).hide();
            topicNumber = topicNumber - 1;
            $("#current").text(topicNumber);
            $("#"+topicNumber).show();
            //alert(exam[topicNumber].topic);
            /*$("#topicNumber").text(topicNumber)
            $("#topic").text(exam[topicNumber].topic)
            $("#optionA").text(exam[topicNumber].optionA)
            $("#optionB").text(exam[topicNumber].optionB)
            $("#optionC").text(exam[topicNumber].optionC)
            $("#optionD").text(exam[topicNumber].optionD)*/
        })

        window.onbeforeunload = function (event){
            event.returnValue = "退出数据不会保存，你确定要退出吗？";
        }
    })


</script>
<body>
<form>
    <div style="margin-bottom: 30px;float: left;width: 100%">
        <button type="button" id="previous" class="btn btn-lg btn-primary" style="float: left;margin-left: 20px">上一题</button>
        <button type="button" id="next" class="btn btn-lg btn-primary" style="float: right;margin-right: 50px"><span><span id="current"></span>/<%=questionList.size()%></span>下一题</button>
    </div>
<%
    for(Question question:questionList){
        index += 1;
%>
    <div class="list-group" style="margin-left: 20px" id="<%=index%>" hidden>
        <h4 class="list-group-item-heading" style="margin-top: 20px"><p class="text-primary">第<%=index%>题：<%=question.getQuestion_topic()%></p>
        <p class="list-group-item-text" style="margin-top: 30px;margin-bottom: 60px;font-size: 15px">
            <input style="margin-left: 40px;margin-bottom: 20px;width: 15px;height: 15px" type="radio" name="<%=question.getQuestion_id()%>" value="A">A、<%=question.getQuestion_A()%><br/>
            <input style="margin-left: 40px;margin-bottom: 20px;width: 15px;height: 15px" type="radio" name="<%=question.getQuestion_id()%>" value="B">B、<%=question.getQuestion_B()%><br/>
            <input style="margin-left: 40px;margin-bottom: 20px;width: 15px;height: 15px" type="radio" name="<%=question.getQuestion_id()%>"value="C">C、<%=question.getQuestion_C()%><br/>
            <input style="margin-left: 40px;margin-bottom: 20px;width: 15px;height: 15px" type="radio" name="<%=question.getQuestion_id()%>" value="D">D、<%=question.getQuestion_D()%>
        </p>
    </div>    

<%
    }
%>
    <%--<div class="list-group" style="margin-left: 20px">
        <h4 class="list-group-item-heading" style="margin-top: 20px">第<span id="topicNumber">1</span>题：<span id="topic"></span></h4>
        <p class="list-group-item-text" style="margin-top: 30px;margin-bottom: 60px;font-size: 15px">
            <input style="margin-left: 40px;width: 15px;height: 15px" type="radio" name="" value="A">A、<span id="optionA"></span>
            <input style="margin-left: 40px;width: 15px;height: 15px" type="radio" name="" value="A"></span>B、<span id="optionB"></span>
            <input style="margin-left: 40px;width: 15px;height: 15px" type="radio" name="" value="A"></span>C、<span id="optionC"></span>
            <input style="margin-left: 40px;width: 15px;height: 15px" type="radio" name="" value="A"></span> value="D">D、<span id="optionD"></span>
        </p>
    </div>--%>
    <button type="button" id="submitBtn" class="btn btn-lg btn-primary" style="width: 100px;height: 40px;border-radius: 5%;margin-left: 45%;margin-top: 40px">提交答卷</button>
</form>
</body>
</html>
