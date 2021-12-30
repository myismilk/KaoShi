<%@ page import="com.wangkaiping.domain.Manage" %>
<%@ page import="com.wangkaiping.domain.Question" %>
<%@ page import="java.util.List" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
    Manage user = (Manage) request.getSession(false).getAttribute("user");
    Question question = (Question) request.getAttribute("question");
%>
<!DOCTYPE html>
<html lang="en">
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
                <li class="active">单选题详情界面</li>
            </ol>
        </div>


            <!-- Start Row -->
            <div class="row">
                <!-- Start Panel -->
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-title">
                            试题详情
                        </div>
                        <div class="panel-body table-responsive">
                            <div class="form-group">
                                <label class="form-label">试题编号：</label>
                                <input type="text" class="form-control" value="<%=question.getQuestion_id()%>" readonly>
                                <label class="form-label">试题类型：</label>
                                <input type="text" class="form-control" value="<%=question.getQuestion_type()%>" readonly>
                                <label class="form-label">试题题目：</label>
                                <input type="text" class="form-control" value="<%=question.getQuestion_topic()%>" readonly>
                                <label class="form-label">A选项：</label>
                                <input type="text" class="form-control" value="<%=question.getQuestion_A()%>" readonly>
                                <label class="form-label">B选项：</label>
                                <input type="text" class="form-control" value="<%=question.getQuestion_B()%>" readonly>
                                <label class="form-label">C选项：</label>
                                <input type="text" class="form-control" value="<%=question.getQuestion_C()%>" readonly>
                                <label class="form-label">D选项：</label>
                                <input type="text" class="form-control" value="<%=question.getQuestion_D()%>" readonly>
                                <label class="form-label">试题答案：</label>
                                <input type="text" class="form-control" value="<%=question.getAnswer()%>" readonly>
                                <label class="form-label">试题解析：</label>
                                <input type="text" class="form-control" value="<%=question.getParsing()%>" readonly>
                                <label class="form-label">创建时间：</label>
                                <input type="text" class="form-control" value="<%=question.getCreate_time()%>" readonly>
                                <label class="form-label">修改时间：</label>
                                <input type="text" class="form-control" value="<%=question.getEdit_time()%>" readonly>
                                <label class="form-label">创建人：</label>
                                <input type="text" class="form-control" value="<%=question.getCreate_by()%>" readonly>
                            </div>

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


