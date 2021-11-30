<%@ page import="java.util.Date" %>
<%@ page import="java.text.SimpleDateFormat" %><%--
  Created by IntelliJ IDEA.
  User: 12345678
  Date: 2021/11/16
  Time: 18:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<html>
<head>
    <base href="<%=basePath%>">
    <title>Title</title>
</head>
<link rel="stylesheet" href="css/studentInterface/waitexam/examhome.css">
<script type="application/javascript" src="jQuery/jquery.js"></script>
<script type="application/javascript">
    $(function (){
        var html = '<tr style="background-color: cadetblue"> <td style="height: 60px">考试名称</td> <td style="height: 60px">考试开始时间</td> <td style="height: 60px">考试结束时间</td> <td style="height: 60px">考试发布者</td> <td style="height: 60px">操作</td> </tr>';
        $.ajax({
            url:"workbean/waitexam/getPaper.do",
            data:{
                studentId:20180001
            },
            type:"get",
            dataType:"json",
            success:function (data){
                $.each(data,function (i,n){
                    var newDate = new Date();
                    var endDate = new Date(n.paperEndTime);
                    if(n.state == 1){
                        html +='<tr> <td>'+n.paperName+'</td> <td>'+n.paperStartTime+'</td> <td>'+n.paperEndTime+'</td> <td>'+n.manage+'</td> <td><span style="color: darkgray">已完成考试</span></td> </tr>';
                    } else if(newDate>endDate){
                        html +='<tr> <td>'+n.paperName+'</td> <td>'+n.paperStartTime+'</td> <td>'+n.paperEndTime+'</td> <td>'+n.manage+'</td> <td><span style="color: darkgray">考试已过期，未参加考试</span></td> </tr>';
                    }else {
                        html +='<tr> <td>'+n.paperName+'</td> <td>'+n.paperStartTime+'</td> <td>'+n.paperEndTime+'</td> <td>'+n.manage+'</td> <td><input type="button" value="开始考试" onclick="hint('+n.paperId+')"></td> </tr>';
                    }
                })
                $("#exam-paper").html(html);

            }
        })

    })
    function hint(id){
        var flag = confirm("确认开始考试吗？");
        if(flag){
        window.location.href = "studentInterface/getExam.do?id="+id
        }
    }
</script>
<body>
<div id="exam-home">
    <table id="exam-paper">
        <%--<tr style="background-color: cadetblue">
            <td style="height: 60px">考试名称</td>
            <td style="height: 60px">考试开始时间</td>
            <td style="height: 60px">考试结束时间</td>
            <td style="height: 60px">考试发布者</td>
            <td style="height: 60px">操作</td>
        </tr>
        <tr>
            <td>考试名称</td>
            <td>考试开始时间</td>
            <td>考试结束时间</td>
            <td>考试发布者</td>
            <td>操作</td>
        </tr>--%>
    </table>
</div>

</body>
</html>
