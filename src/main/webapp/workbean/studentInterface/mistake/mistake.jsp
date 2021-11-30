<%@ page import="com.wangkaiping.domain.Question" %>
<%@ page import="java.util.List" %>
<%@ page import="com.wangkaiping.vo.MistakeVo" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    List<MistakeVo> mistakeVoList = (List<MistakeVo>) request.getAttribute("mistakeVoList");
%>
<html>
<head>
    <title>Title</title>
</head>
<style type="text/css">
    #misTake-home{
        width: 100%;
    }
    table{
        width: 99%;
    }
    table tr td{
        width: 14%;
        height: 100px;
        text-align: center;
        border: solid 1px black;
    }
</style>
<body>
<div id="misTake-home">
    <table>
    <tr style="background-color: cadetblue">
        <td style="height: 60px">题目</td>
        <td style="height: 60px">A选项</td>
        <td style="height: 60px">B选项</td>
        <td style="height: 60px">C选项</td>
        <td style="height: 60px">D选项</td>
        <td style="height: 60px">答案</td>
        <td style="height: 60px">操作</td>
    </tr>
    <%
        for(MistakeVo mistakeVo:mistakeVoList){
    %>
    <tr style="background-color: cadetblue">
        <td><%=mistakeVo.getQuestion_topic()%></td>
        <td><%=mistakeVo.getQuestion_A()%></td>
        <td><%=mistakeVo.getQuestion_B()%></td>
        <td><%=mistakeVo.getQuestion_C()%></td>
        <td><%=mistakeVo.getQuestion_D()%></td>
        <td><%=mistakeVo.getAnswer()%></td>
        <td><input type="button" value="删除|已懂<%=mistakeVo.getMistakeId()%>"></td>
    </tr>
    <%
        }
    %>
    </table>
</div>
</body>
</html>
