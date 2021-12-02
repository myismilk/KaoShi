
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <base href="<%=basePath%>">
    <!-- 最新版本的 Bootstrap 核心 CSS 文件 -->
    <script type="application/javascript" src="jQuery/jquery.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" integrity="sha384-HSMxcRTRxnN+Bdg0JdbxYKrThecOKuH5zCYotlSAcp1+c8xmyTe9GYg1l9a69psu" crossorigin="anonymous">

    <!-- 可选的 Bootstrap 主题文件（一般不用引入） -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css" integrity="sha384-6pzBo3FDv/PJ8r2KRkGHifhEocL+1X2rVCTTkUfGk7/0pbek5mMa1upzvWbrUbOZ" crossorigin="anonymous">

    <!-- 最新的 Bootstrap 核心 JavaScript 文件 -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js" integrity="sha384-aJ21OjlMXNL5UyIl/XNwTMqvzeRMZH2w8c5cRVpzpU8Y5bApTppSuUkhZXN0VxHd" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/left.css">

    <script type="application/javascript">
        $(function (){
            $.ajax({
                url:"getWaitExamNum.do",
                type:"get",
                dataType:"json",
                success:function (data){
                    $("#num").html(data);
                }
            })
            //加载完窗口列表栏需默认显示点击的是第一行
            $(".nav li a").eq(0).css("background","deepskyblue");
            $(".nav li a").eq(0).css("font-size","26px");



            //导航栏的点击效果
            $(".nav li").click(function (){
                $(".nav li a").css("background","white");
                $(".nav li a").css("font-size","20px");
                var indexNum = $(".nav li").index(this);
                $(".nav li a").eq(indexNum).css("background","deepskyblue");
                $(".nav li a").eq(indexNum).css("font-size","26px");
            })
        })

    </script>

</head>
<body>
<ul class="nav nav-pills nav-stacked" style="text-align: center;font-size: 20px;list-style: none;">
    <li role="presentation"><a href="workbean/self/studentMessage.do" target="right"><span class="glyphicon glyphicon-user"></span>个人中心</a></li>
    <li role="presentation"><a href="kaoShiNotify.do" target="right"><span class="glyphicon glyphicon-education"></span>考试须知</a></li>
    <li role="presentation"><a href="waitExam.do" target="right" style="position: relative"><span class="glyphicon glyphicon-comment"></span>待考通知<span id="num" class="badge" style="position: absolute"></span></a></li>
    <li role="presentation"><a href="#" target="right"><span class="glyphicon glyphicon-folder-open"></span>考试记录</a></li>
    <li role="presentation"><a href="workbean/studentInterface/mistake/mistake.do" target="right"><span class="glyphicon glyphicon-eye-open"></span>错题回顾</a></li>
</ul>


<a style="font-size: "></a>
</body>
</html>
