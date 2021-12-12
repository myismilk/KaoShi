<%--
  Created by IntelliJ IDEA.
  User: 12345678
  Date: 2021/11/15
  Time: 20:26
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
    <title></title>
</head>
<style>

</style>
<body>
<div style="font-size: 18px">
    ------------在线考试注意事项>>>
    <p class="text-danger">1.考题由管理员统一发放，满分为100分。其中，单选40道，每道1.5分，共60分；多选题10道，每道2分，共20分；判断题20道，每道1分，共20分。</p>
    <p class="text-danger">2.考试时间为60分钟。进入考试页面后，系统自动倒计时，60分钟内完成答题可点击“提交答卷”提前交卷，超过60分钟系统会自动提交答卷。试卷一旦提交，将不能再次考试。</p>
    <p class="text-danger">3.考试时须使用IE浏览器，不要使用手机、平板电脑（IPAD）等其他移动终端设备考试。</p>
    <p class="text-danger">4.如果多人使用同一台电脑进行考试的，须逐人进行，即前一名考生答题完毕并提交答卷、退出考试系统后，下一名考生方可登录考试，否则系统将无法记录成绩。</p>
    <p class="text-danger">5.考试过程中不要点击浏览器“刷新”按钮，否则系统会重新出题，原答题信息丢失并相应减少一次登录考试机会。</p>
    <p class="text-danger">6.由于考试人员较多，请合理安排考试时间，避免遇上网络拥堵情况。如在登录考试时，出现“超过最大在线人数”提示，请换个时间段再登录考试。</p>
    <p class="text-danger">特殊情况处理指南
    <p class="text-danger">1.问：如果你在提交答卷时，系统提示你“系统异常，请换个时间段登录考试”怎么办。答：这很可能是你的终端网络不稳定，答题过程中发生瞬间掉线现象。这时请不要着急马上登录考试，请过一段时间再考。如果条件允许，最好换一台电脑。</p>
    <p class="text-danger">2.问：如果你登录考试时，系统出现对话框，提示你“登录信息错误”怎么办？ 答：这说明你在注册时，注册错了XX等重要信息。请仔细想想你当时的注册。</p>
    <p class="text-danger">3.问：点击提交答卷后，出现蓝屏或其他情况，没法确定是否顺利完成考试，怎么办？答：可以点击考试“考试结果查询”，查看考试情况。</p>
    <p class="text-danger">4.问：如果在答题过程中，忽然屏幕一闪，回到第一题，且答题结果消失，怎么办？答：请点击“检测答卷”按钮，然后点击屏幕下方的“返回试卷”，便可继续答题。</p>
</div>

</body>
</html>
