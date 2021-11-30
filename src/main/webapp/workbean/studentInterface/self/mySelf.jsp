<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>Title</title>
    <link rel="stylesheet" type="text/css" href="css/studentInterface/mySelf.css">
</head>
<script type="application/javascript" src="jQuery/jquery.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

<!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">

<!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
<script type="application/javascript">
    $(function (){

        /*//点击修改头像的按钮



        //鼠标放再图片上显示修改头像按钮
        $("#photo").mouseover(function (){
            $("#edit-photo").show();
        })
        //移开鼠标隐藏修改头像按钮
        $("#photo").mouseout(function (){
            $("#edit-photo").hide();
        })*/


        //个人评价的点击按钮
        $("#submit-Btn").click(function (){
            var text = $("#evaluation").val();
            if(confirm("确认要修改个人评价？")){
            $.ajax({
                url:"workbean/studentInterface/self/editEvaluation.do",
                data:{
                    context:text,
                    studentId:20180001
                },
                type:"post",
                dataType:"text",
                success:function (result){
                    alert(result)
                }
            })
            }
        })

    })

</script>
<body>
<p style="font-size: 50px;color: lightsteelblue">个人信息>>>></p>
<hr>
<div id="message" style="position: relative">
    <div>

    <div id="photo">
        <div id="edit-photo" style="position: absolute;background:rgba(255,255,255,0.5);text-align: center;width: 245px;height:40px;line-height:40px;display: none">
            点击修改头像
        </div>
        <img src="image/studentInterface/studentImg/${student.student_img}" style="width: 100%;height: 100%">
    </div>
    <div id="detailed">
                <ul class="list-group" style="list-style: none;font-size: 20px;">
                    <li class="list-group-item"><label style="float: left" >学号：</label><input type="text" style="width: 400px" class="form-control" value="${student.student_id}" readonly></li>
                    <li class="list-group-item"><label style="float: left" >姓名：</label><input type="text" style="width: 400px" class="form-control" value="${student.student_name}" readonly></li>
                    <li class="list-group-item"><label style="float: left" >性别：</label><input type="text" style="width: 400px" class="form-control" value="${student.student_gender}" readonly></li>
                    <li class="list-group-item"><label style="float: left" >年级：</label><input type="text" style="width: 400px" class="form-control" value="${student.student_grade}" readonly></li>
                    <li class="list-group-item"><label style="float: left" >学院：</label><input type="text" style="width: 400px" class="form-control" value="${student.student_college}" readonly></li>
                    <li class="list-group-item"><label style="float: left" >学历：</label><input type="text" style="width: 400px" class="form-control" value="${student.student_education}" readonly></li>
                </ul>
    </div>
    </div>
    <div id="selfEvaluation">
        <div><label style="float: left;font-size: 25px" >自我评价：</label>
            <input type="button" id="submit-Btn" class="btn btn-primary" style="float: right" value="提交自我评价"></input>
        </div>
        <textarea id="evaluation" class="form-control" rows="4">${student.student_evaluation}</textarea>
    </div>
</div>

</body>
</html>
