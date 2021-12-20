<%@ page import="com.wangkaiping.domain.Manage" %>
<%@ page import="com.wangkaiping.domain.Question" %>
<%@ page contentType="text/html;charset=utf-8" pageEncoding="UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
    Manage user = (Manage) request.getSession(false).getAttribute("user");
%>
<html>
<head>
    <base href="<%=basePath%>">
    <title>管理页面</title>
    <!-- BEGIN GLOBAL MANDATORY STYLES -->
    <link href="Content/Common/bootstrap-3.3.2-dist/css/bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="Content/Common/Font-Awesome-3.2.1/css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="Content/Styles/style.css" rel="stylesheet" type="text/css" />
    <link href="Content/Common/Styles/datatables/datatables.css" rel="stylesheet" type="text/css" />
    <link href="Content/Common/Styles/bootstrap-select/bootstrap-select.css" rel="stylesheet" type="text/css" />
    <link href="Content/Common/Styles/awesome-bootstrap-checkbox/awesome-bootstrap-checkbox.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        label{
            margin-top: 30px;
        }
    </style>

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
        <a href="javascript:void(0)" class="sidebar-open-button"><i class="fa fa-bars"></i></a>
        <a href="javascript:void(0)" class="sidebar-open-button-mobile"><i class="fa fa-bars"></i></a>
        <a href="#sidepanel" class="sidepanel-open-button"><i class="fa fa-outdent"></i></a>
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
                <a href="javascript:void(0)"><span class="icon color7"><i class="fa fa-user"></i></span>用户及权限管理<span class="caret"></span></a>
                <ul>
                    <li><a href="javascript:void(0)">用户资料管理</a></li>
                    <li><a href="javascript:void(0)">权限管理</a></li>
                    <li><a href="javascript:void(0)">组织机构管理</a></li>
                    <li><a href="javascript:void(0)">功能模块管理</a></li>
                </ul>
            </li>

            <li>
                <a href="javascript:void(0)"><span class="icon color14"><i class="fa fa-book"></i></span>题库管理<span class="caret"></span></a>
                <ul>
                    <li><a href="toScManage">单选试题管理</a></li>
                    <li><a href="toMcManage">多选试题管理</a></li>
                    <li><a href="toTFManage">判断试题管理</a></li>
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
            <h1 class="title">题库管理</h1>
            <ol class="breadcrumb">
                <li class="active">判断题添加界面</li>
            </ol>
        </div>


            <!-- Start Row -->
            <div class="row">
                <!-- Start Panel -->
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-title">
                            试题添加：
                        </div>
                        <div class="panel-body table-responsive">
                            <form action="toAddTFQuestion" method="post">
                            <div class="form-group">
                                <%--添加的试题的类型，当前是多选题界面--%>
                                <input type="text" name="question_type" value="3" hidden>
                                <label class="form-label">试题题目：</label>
                                <input type="text" name="question_topic" class="form-control" >
                                <label class="form-label">试题答案：</label><br>
                                    <select name="answer">
                                        <option value="√">√</option>
                                        <option value="×">×</option>
                                    </select><br>

                                <label class="form-label">试题解析：</label>
                                <input type="text" name="parsing" class="form-control">
                                    <%--试题创建者--%>
                                <input type="text" name="create_by" value="<%=user.getManage_id()%>" hidden>
                            </div>
                            <button type="submit" class="btn btn-info" id="editCommitBtn"><i class="fa fa-edit"></i></i>添加试题</button>
                            </form>
                        </div>

                    </div>
                </div>
                <!-- End Panel -->
            </div>
            <!-- End Row -->


    <script src="Content/Common/jquery-1.11.1/jquery.min.js" type="text/javascript"></script>
    <script src="Content/Common/bootstrap-3.3.2-dist/js/bootstrap.min.js" type="text/javascript"></script>
    <script src="Content/Scripts/plugins.js" type="text/javascript"></script>
    <script type="text/javascript" src="Content/Common/Scripts/bootstrap-select/bootstrap-select.js"></script>
    <script type="text/javascript" src="Content/Common/Scripts/bootstrap-toggle/bootstrap-toggle.min.js"></script>
    <script src="Content/Common/Scripts/datatables/datatables.min.js" type="text/javascript"></script>
    </div>
</body>

</html>


