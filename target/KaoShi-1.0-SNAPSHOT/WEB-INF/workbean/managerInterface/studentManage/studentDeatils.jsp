﻿<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.wangkaiping.domain.Manage" %>
<%@ page import="java.util.List" %>
<%@ page import="com.wangkaiping.domain.Student" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
    Manage user = (Manage) request.getSession(false).getAttribute("user");
    Student student = (Student) request.getAttribute("student");
%>
<html>
<head>
    <base href="<%=basePath%>">
    <meta charset="utf-8" />
    <title>管理页面</title>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="Content/Common/bootstrap-3.3.2-dist/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="Content/Common/Font-Awesome-3.2.1/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="Content/Styles/style.css" rel="stylesheet" type="text/css" />
    <link href="Content/Common/Styles/datatables/datatables.css" rel="stylesheet" type="text/css" />
    <link href="Content/Common/Styles/bootstrap-select/bootstrap-select.css" rel="stylesheet" type="text/css" />
    <link href="Content/Common/Styles/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet" type="text/css" />
    <!-- END GLOBAL MANDATORY STYLES -->
</head>
<!-- END HEAD -->
<!-- BEGIN BODY -->
<body>
<!-- Start Page Loading -->
<div class="loading"><img src="Content/Images/loading.gif" alt="loading-img"></div>
<!-- End Page Loading -->
<!-- //////////////////////////////////////////////////////////////////////////// -->
<!-- START TOP -->
<div id="top" class="clearfix">
    <!-- Start App Logo-->
    <div class="applogo">
        <a href="javascript:void(0)" class="logo">考试系统</a>
    </div>
    <!-- End App Logo -->
    <!-- Start Sidebar Show Hide Button -->
    <a href="javascript:void(0)" class="sidebar-open-button"><i class="fa fa-bars"></i></a>
    <a href="javascript:void(0)" class="sidebar-open-button-mobile"><i class="fa fa-bars"></i></a>
    <!-- End Sidebar Show Hide Button -->
    <!-- Start Sidepanel Show-Hide Button -->
    <a href="#sidepanel" class="sidepanel-open-button"><i class="fa fa-outdent"></i></a>
    <!-- End Sidepanel Show-Hide Button -->
    <!-- Start Top Right -->
    <ul class="top-right">
        <li class="dropdown link">
            <a href="javascript:void(0)" data-toggle="dropdown" class="dropdown-toggle profilebox"><img src="Content/Images/test/user.png" /><b><%=user.getManage_username()%></b><span class="caret"></span></a>
            <ul class="dropdown-menu dropdown-menu-list dropdown-menu-right">
                <li><a href="javascript:void(0)"><i class="fa falist fa-wrench"></i>设置</a></li>
                <li><a href="javascript:void(0)"><i class="fa falist fa-power-off"></i> 退出</a></li>
            </ul>
        </li>
    </ul>
</div>
<!-- End Top Right -->
<!-- END TOP -->
<!-- //////////////////////////////////////////////////////////////////////////// -->
<!-- //////////////////////////////////////////////////////////////////////////// -->
<!-- START SIDEBAR -->
<div class="sidebar clearfix">
    <ul class="sidebar-panel nav">
        <li><a href="javascript:void(0)"><span class="icon color11"><i class="fa fa-user"></i></span>当前用户：<%=user.getManage_username()%></a></li>
        <li><a href="javascript:void(0)"><span class="icon color8"></span>真实姓名：<%=user.getManage_name()%></a></li>
        <li><a href="javascript:void(0)"><span class="icon color8"></span>用户身份：管理员</a></li>
        <li class="sidetitle">系统导航</li>
        <li>
            <a href="javascript:void(0)"><span class="icon color7"><i class="fa fa-user"></i></span>学生管理<span class="caret"></span></a>
            <ul>
                <li><a href="toStudentManageInterface">用户资料管理</a></li>
                <%--<li><a href="javascript:void(0)">权限管理</a></li>--%>
            </ul>
        </li>

        <li>
            <a href="javascript:void(0)"><span class="icon color14"><i class="fa fa-book"></i></span>题库管理<span class="caret"></span></a>
            <ul>
                <li><a href="toScManage">单选试题管理</a></li>
                <li><a href="toMcManage">多选试题管理</a></li>
                <li><a href="toTFManage">判断试题管理</a></li>
                <%--<li><a href="javascript:void(0)">审核试题管理<span class="label label-danger">NEW</span></a></li>--%>
            </ul>
        </li>
        <li>
            <a href="javascript:void(0)"><span class="icon color10"><i class="fa fa-check-square-o"></i></span>组卷管理<span class="caret"></span></a>
            <ul>
                <li><a href="javascript:void(0)">结构化组卷</a></li>
                <li><a href="javascript:void(0)">多课程组卷</a></li>
                <li><a href="javascript:void(0)">手工组卷</a></li>
            </ul>
        </li>

        <li><a href="Test_paper.html"><span class="icon color11"><i class="fa fa-file-text-o"></i></span>试卷管理</a></li>
        <li><a href="javascript:void(0)"><span class="icon color12"><i class="fa fa-power-off"></i></span>退出系统</a></li>
    </ul>
</div>

<div class="content">

    <!-- Start Page Header -->
    <div class="page-header">
        <h1 class="title">用户资料管理</h1>
        <ol class="breadcrumb">
            <li><a href="index.html">用户及权限管理</a></li>
            <li class="active">用户资料管理</li>
        </ol>
    </div>
    <!-- End Page Header -->
    <!-- Start Presentation -->
    <!-- Start Row -->
    <div class="row">
        <!-- Start Panel -->
        <div class="col-md-12">
            <div class="panel panel-default">
                <div class="panel-title">
                    学生详情
                </div>
                <div class="panel-body table-responsive">
                    <div class="form-group">
                        <label class="form-label">学生学号：</label>
                        <input type="text" class="form-control" value="<%=student.getStudent_id()%>" readonly>
                        <label class="form-label">学生姓名：</label>
                        <input type="text" class="form-control" value="<%=student.getStudent_name()%>" readonly>
                        <label class="form-label">学生性别：</label>
                        <input type="text" class="form-control" value="<%=student.getStudent_gender()%>" readonly>
                        <label class="form-label">学生班级：</label>
                        <input type="text" class="form-control" value="<%=student.getStudent_grade()%>" readonly>
                        <label class="form-label">所在院系：</label>
                        <input type="text" class="form-control" value="<%=student.getStudent_college()%>" readonly>
                        <label class="form-label">学历：</label>
                        <input type="text" class="form-control" value="<%=student.getStudent_education()%>" readonly>
                    </div>

                </div>

            </div>
        </div>
        <!-- End Panel -->
    </div>
    <!-- End Row -->


</div>
<!-- END CONTAINER -->
<script src="Content/Common/jquery-1.11.1/jquery.min.js" type="text/javascript"></script>
<script src="Content/Common/bootstrap-3.3.2-dist/js/bootstrap.min.js" type="text/javascript"></script>
<script src="Content/Scripts/plugins.js" type="text/javascript"></script>
<script type="text/javascript" src="Content/Common/Scripts/bootstrap-select/bootstrap-select.js"></script>
<script type="text/javascript" src="Content/Common/Scripts/bootstrap-toggle/bootstrap-toggle.min.js"></script>
<script src="Content/Common/Scripts/datatables/datatables.min.js" type="text/javascript"></script>

<script>
    $(document).ready(function () {
        $('#example0').DataTable();
    });
</script>
<script>
    $(document).ready(function () {
        var table = $('#example').DataTable({
            "columnDefs": [
                { "visible": false, "targets": 2 }
            ],
            "order": [[2, 'asc']],
            "displayLength": 25,
            "drawCallback": function (settings) {
                var api = this.api();
                var rows = api.rows({ page: 'current' }).nodes();
                var last = null;

                api.column(2, { page: 'current' }).data().each(function (group, i) {
                    if (last !== group) {
                        $(rows).eq(i).before(
                            '<tr class="group"><td colspan="5">' + group + '</td></tr>'
                        );

                        last = group;
                    }
                });
            }
        });

        // Order by the grouping
        $('#example tbody').on('click', 'tr.group', function () {
            var currentOrder = table.order()[0];
            if (currentOrder[0] === 2 && currentOrder[1] === 'asc') {
                table.order([2, 'desc']).draw();
            }
            else {
                table.order([2, 'asc']).draw();
            }
        });
    });
</script>

<!--特有-->
<!-- Basic Date Range Picker -->
<script type="text/javascript">
    $(document).ready(function () {
        $('#date-range-picker').daterangepicker(null, function (start, end, label) {
            console.log(start.toISOString(), end.toISOString(), label);
        });
    });
</script>

<!-- Basic Single Date Picker -->
<script type="text/javascript">
    $(document).ready(function () {
        $('#date-picker').daterangepicker({ singleDatePicker: true }, function (start, end, label) {
            console.log(start.toISOString(), end.toISOString(), label);
        });
    });
</script>
<!-- Date Range and Time Picker -->
<script type="text/javascript">
    $(document).ready(function () {
        $('#date-range-and-time-picker').daterangepicker({
            timePicker: true,
            timePickerIncrement: 30,
            format: 'MM/DD/YYYY h:mm A'
        }, function (start, end, label) {
            console.log(start.toISOString(), end.toISOString(), label);
        });
    });
</script>

</body>
<!-- END BODY -->

</html>


