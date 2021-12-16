<%@ page import="com.wangkaiping.domain.Manage" %>
<%@ page import="com.wangkaiping.domain.Question" %>
<%@ page import="java.util.List" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
    Manage user = (Manage) request.getSession(false).getAttribute("user");
    List<Question> questionList = (List<Question>) request.getAttribute("questionList");
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
                    <li><a href="javascript:void(0)">多选试题管理</a></li>
                    <li><a href="javascript:void(0)">判断试题管理</a></li>
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
                <li class="active">单选题管理</li>
            </ol>
        </div>


            <div class="row">
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-title">
                            筛选条件
                        </div>
                        <div class="panel-body">
                            <div class="col-md-12 form-group">
                                <label for="input1" class="form-label">课程：</label>
                                <select class="selectpicker" data-style="btn-success">
                                    <option>全部</option>
                                    <option>高等数学</option>
                                    <option>大学英语</option>
                                    <option>病理学</option>
                                </select>
                            </div>
                            <div class="col-md-3 form-group">
                                <label for="input1" class="form-label">题型：</label>
                                <select class="selectpicker">
                                    <option>全部</option>
                                    <option>A1题型</option>
                                    <option>单选题</option>
                                    <option>多选题</option>
                                    <option>判断题</option>
                                    <option>填空题</option>
                                </select>
                            </div>
                            <div class="col-md-3 form-group">
                                <label for="input1" class="form-label">题源：</label>
                                <select class="selectpicker">
                                    <option>全部</option>
                                    <option>自编</option>
                                    <option>真题</option>
                                </select>
                            </div>
                            <div class="col-md-3 form-group">
                                <label for="input1" class="form-label">考试类型：</label>
                                <select class="selectpicker">
                                    <option>全部</option>
                                    <option>期中考试</option>
                                    <option>期末考试</option>
                                    <option>期末补考</option>
                                    <option>毕业会考</option>
                                    <option>小测验</option>
                                </select>
                            </div>
                            <div class="col-md-3 form-group">
                                <label for="input1" class="form-label">适应层次：</label>
                                <select class="selectpicker">
                                    <option>全部</option>
                                    <option>博士生</option>
                                    <option>硕士生</option>
                                    <option>本科生</option>
                                    <option>专科生</option>
                                </select>
                            </div>
                            <div class="col-md-3 form-group">
                                <label for="input1" class="form-label">要求度：</label>
                                <select class="selectpicker">
                                    <option>全部</option>
                                    <option>了解</option>
                                    <option>掌握</option>
                                    <option>熟悉</option>
                                    <option>超纲</option>
                                </select>
                            </div>
                            <div class="col-md-3 form-group">
                                <label for="input1" class="form-label">难度：</label>
                                <select class="selectpicker">
                                    <option>全部</option>
                                    <option>难</option>
                                    <option>较难</option>
                                    <option>中等</option>
                                    <option>较易</option>
                                    <option>易</option>
                                </select>
                            </div>

                            <div class="col-md-3 form-group">
                                <label for="input1" class="form-label">认知类别：</label>
                                <select class="selectpicker">
                                    <option>全部</option>
                                    <option>记忆</option>
                                    <option>解释</option>
                                    <option>应用</option>
                                </select>
                            </div>
                            <div class="col-md-3 form-group">
                                <label for="input1" class="form-label">审核：</label>
                                <select class="selectpicker">
                                    <option>全部</option>
                                    <option>通过</option>
                                    <option>未通过</option>
                                </select>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- Start Row -->
            <div class="row">
                <!-- Start Panel -->
                <div class="col-md-12">
                    <div class="panel panel-default">
                        <div class="panel-title">
                            试题资料
                        </div>
                        <div class="panel-body table-responsive">

                            <table id="example0" class="table display">
                                <thead>
                                    <tr>
                                        <th>试题编号</th>
                                        <th>题型</th>
                                        <th>题目</th>
                                        <th>创建时间</th>
                                        <th>修改人</th>
                                        <th>创建人</th>
                                        <th>编辑</th>
                                    </tr>
                                </thead>

                                <tbody>
                                <%for(Question question:questionList) {
                                %>
                                    <tr>
                                        <td class="text-center">1</td>
                                        <th><%=question.getQuestion_type()%></th>
                                        <th><%=question.getQuestion_topic()%></th>
                                        <th><%=question.getCreate_time()%></th>
                                        <th><%=question.getEdit_time()%></th>
                                        <th><%=question.getCreate_by()%></th>
                                        <td>
                                            <a href="javascript:void(0)" class="btn btn-info"><i class="fa fa-edit"></i>编辑试题 </a>
                                            <a href="javascript:void(0)" class="btn btn-info"><i class="fa fa-trash"></i>删除试题 </a>
                                            <a href="Test_Info.html" class="btn btn-info"><i class="fa fa-file-text-o"></i>查看详情</a>
                                        </td>
                                    </tr>
                                <%
                                    }
                                %>
                                </tbody>
                            </table>


                        </div>

                    </div>
                </div>
                <!-- End Panel -->
            </div>
            <!-- End Row -->
        </div>
        <!-- END CONTAINER -->
        <!-- //////////////////////////////////////////////////////////////////////////// -->
        <!-- Start Footer -->
        <div class="row footer">
            <div class="col-md-6 text-left">
                Copyright © 2021 <a href="http://www.17sucai.com/" target="_blank">考试系统</a> All rights reserved.
            </div>
        </div>
        <!-- End Footer -->


    </div>
    <div role="tabpanel" class="sidepanel">

        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li role="presentation" class="active"><a href="#today" aria-controls="today" role="tab" data-toggle="tab">TODAY</a></li>
            <li role="presentation"><a href="#tasks" aria-controls="tasks" role="tab" data-toggle="tab">TASKS</a></li>
            <li role="presentation"><a href="#chat" aria-controls="chat" role="tab" data-toggle="tab">CHAT</a></li>
        </ul>

        <!-- Tab panes -->
        <div class="tab-content">

            <!-- Start Today -->
            <div role="tabpanel" class="tab-pane active" id="today">

                <div class="sidepanel-m-title">
                    Today
                    <span class="left-icon"><a href="javascript:void(0)"><i class="fa fa-refresh"></i></a></span>
                    <span class="right-icon"><a href="javascript:void(0)"><i class="fa fa-file-o"></i></a></span>
                </div>

                <div class="gn-title">NEW</div>

                <ul class="list-w-title">
                    <li>
                        <a href="javascript:void(0)">
                            <span class="label label-danger">ORDER</span>
                            <span class="date">9 hours ago</span>
                            <h4>New Jacket 2.0</h4>
                            Etiam auctor porta augue sit amet facilisis. Sed libero nisi, scelerisque.
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            <span class="label label-success">COMMENT</span>
                            <span class="date">14 hours ago</span>
                            <h4>Bill Jackson</h4>
                            Etiam auctor porta augue sit amet facilisis. Sed libero nisi, scelerisque.
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            <span class="label label-info">MEETING</span>
                            <span class="date">at 2:30 PM</span>
                            <h4>Developer Team</h4>
                            Etiam auctor porta augue sit amet facilisis. Sed libero nisi, scelerisque.
                        </a>
                    </li>
                    <li>
                        <a href="javascript:void(0)">
                            <span class="label label-warning">EVENT</span>
                            <span class="date">3 days left</span>
                            <h4>Birthday Party</h4>
                            Etiam auctor porta augue sit amet facilisis. Sed libero nisi, scelerisque.
                        </a>
                    </li>
                </ul>

            </div>
            <!-- End Today -->
            <!-- Start Tasks -->
            <div role="tabpanel" class="tab-pane" id="tasks">

                <div class="sidepanel-m-title">
                    To-do List
                    <span class="left-icon"><a href="javascript:void(0)"><i class="fa fa-pencil"></i></a></span>
                    <span class="right-icon"><a href="javascript:void(0)"><i class="fa fa-trash"></i></a></span>
                </div>

                <div class="gn-title">TODAY</div>

                <ul class="todo-list">
                    <li class="checkbox checkbox-primary">
                        <input id="checkboxside1" type="checkbox"><label for="checkboxside1">Add new products</label>
                    </li>

                    <li class="checkbox checkbox-primary">
                        <input id="checkboxside2" type="checkbox"><label for="checkboxside2"><b>May 12, 6:30 pm</b> Meeting with Team</label>
                    </li>

                    <li class="checkbox checkbox-warning">
                        <input id="checkboxside3" type="checkbox"><label for="checkboxside3">Design Facebook page</label>
                    </li>

                    <li class="checkbox checkbox-info">
                        <input id="checkboxside4" type="checkbox"><label for="checkboxside4">Send Invoice to customers</label>
                    </li>

                    <li class="checkbox checkbox-danger">
                        <input id="checkboxside5" type="checkbox"><label for="checkboxside5">Meeting with developer team</label>
                    </li>
                </ul>

                <div class="gn-title">TOMORROW</div>
                <ul class="todo-list">
                    <li class="checkbox checkbox-warning">
                        <input id="checkboxside6" type="checkbox"><label for="checkboxside6">Redesign our company blog</label>
                    </li>

                    <li class="checkbox checkbox-success">
                        <input id="checkboxside7" type="checkbox"><label for="checkboxside7">Finish client work</label>
                    </li>

                    <li class="checkbox checkbox-info">
                        <input id="checkboxside8" type="checkbox"><label for="checkboxside8">Call Johnny from Developer Team</label>
                    </li>

                </ul>
            </div>
            <!-- End Tasks -->
            <!-- Start Chat -->
            <div role="tabpanel" class="tab-pane" id="chat">

                <div class="sidepanel-m-title">
                    Friend List
                    <span class="left-icon"><a href="javascript:void(0)"><i class="fa fa-pencil"></i></a></span>
                    <span class="right-icon"><a href="javascript:void(0)"><i class="fa fa-trash"></i></a></span>
                </div>

                <div class="gn-title">ONLINE MEMBERS (3)</div>
                <ul class="group">
                    <li class="member"><a href="javascript:void(0)"><img src="img/profileimg.png" alt="img"><b>Allice Mingham</b>Los Angeles</a><span class="status online"></span></li>
                    <li class="member"><a href="javascript:void(0)"><img src="img/profileimg2.png" alt="img"><b>James Throwing</b>Las Vegas</a><span class="status busy"></span></li>
                    <li class="member"><a href="javascript:void(0)"><img src="img/profileimg3.png" alt="img"><b>Fred Stonefield</b>New York</a><span class="status away"></span></li>
                    <li class="member"><a href="javascript:void(0)"><img src="img/profileimg4.png" alt="img"><b>Chris M. Johnson</b>California</a><span class="status online"></span></li>
                </ul>

                <div class="gn-title">OFFLINE MEMBERS (8)</div>
                <ul class="group">
                    <li class="member"><a href="javascript:void(0)"><img src="img/profileimg5.png" alt="img"><b>Allice Mingham</b>Los Angeles</a><span class="status offline"></span></li>
                    <li class="member"><a href="javascript:void(0)"><img src="img/profileimg6.png" alt="img"><b>James Throwing</b>Las Vegas</a><span class="status offline"></span></li>
                </ul>

                <form class="search">
                    <input type="text" class="form-control" placeholder="Search a Friend...">
                </form>
            </div>
            <!-- End Chat -->

        </div>

    </div>
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


