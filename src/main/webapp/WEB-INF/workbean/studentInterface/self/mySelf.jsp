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

        //点击修改头像的按钮



        //鼠标放再图片上显示修改头像按钮
        $("#photo").mouseover(function (){
            $("#edit-photo").show();
        })
        //移开鼠标隐藏修改头像按钮
        $("#photo").mouseout(function (){
            $("#edit-photo").hide();
        })

        //修改头像按钮
        $("#edit-photoBtn").click(function () {
            $("#edit-photoModal").modal("show");

        })


        //个人评价的点击按钮
        $("#submit-Btn").click(function (){
            $("#selfModal").modal("show");
        })


        //模态窗口的提交按钮
        $("#commitBtn").click(function () {
            var text = $.trim($("#modalcontent").val());
            if(text==""){
                alert("请填写修改内容。");
                return;
            }
            $.ajax({
                url:"workbean/studentInterface/self/editEvaluation.do",
                data:{
                    context:text,
                    studentId:20180001
                },
                type:"post",
                dataType:"text",
                success:function (result){
                    alert(result);
                    if(result=="修改成功"){
                        $("#evaluation").val(text);
                        $("#modalcontent").val()
                        $("#selfModal").modal("hide");
                    }
                }
            })
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
            <a href="javascript:void(0)" id="edit-photoBtn">点击修改头像</a>
        </div>
        <%--修改个人头像的模态窗口--%>
        <div class="modal fade" id="edit-photoModal" tabindex="-1" role="dialog">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title">修改头像</h4>
                        <form action="workbean/studentInterface/self/editPhoto" method="post" enctype="multipart/form-data">
                            <input value="${student.student_id}" name="studentId" hidden>
                            <input type="file" name="photoFile">
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                <button type="submit" class="btn btn-primary">提交修改</button>
                            </div>
                        </form>
                    </div>

                </div><!-- /.modal-content -->
            </div><!-- /.modal-dialog -->
        </div><!-- /.modal -->
        <img src="userImg/${student.student_img}" style="width: 100%;height: 100%">
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
            <input type="button" id="submit-Btn" class="btn btn-primary" style="float: right" value="修改自我评价"></input>
        </div>
        <textarea id="evaluation" class="form-control" rows="4">${student.student_evaluation}</textarea>
    </div>

    <%--修改个人评价的模态窗口--%>
    <div class="modal fade" id="selfModal" tabindex="-1" role="dialog">
        <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                    <h4 class="modal-title">修改个人评价窗口</h4>
                </div>
                <div class="modal-body" style="height: 200px;">
                    <textarea id="modalcontent" placeholder="填写修改的信息......" style="font-size: 20px;height: 180px;width: 550px"></textarea>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                    <button type="button" id="commitBtn" class="btn btn-primary">提交修改</button>
                </div>
            </div><!-- /.modal-content -->
        </div><!-- /.modal-dialog -->
    </div><!-- /.modal -->


</div>
</body>
</html>
