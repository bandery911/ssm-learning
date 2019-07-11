<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
<%@ include file="rootPath.jsp" %>
<head>
    <title>用户信息</title>
    <!--设备自适应，对移动设备友好，确保适当的绘制和触屏缩放-->
    <meta name="viewport" content="width=device-width, initial-scale=1.0" charset="UTF-8">
    <!-- jQuery (Bootstrap 的 JavaScript 插件需要引入 jQuery)，需要在bootstrap前引入 -->
    <script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
    <!-- 引入 Bootstrap -->
    <link rel="stylesheet" href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
    <script src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <script>
        //向删除确认的模态框中传递用户信息的参数，用于显示
        function values(userid, username, address) {
            $('#usernameToDelete').children("input:hidden").val(userid);
            $('#usernameToDelete').children("p").html(username + "&emsp;&emsp;" + address);
        }

        //点击 增加员工 导航时，显示对应的div
        function addUserBar() {
            $("#allUserInfoDiv").attr("style", "display:none;");
            $("#addUserDiv").attr("style", "display:block;");
            $("#addUserBarLi").addClass("active");
            $("#userInfoBarLi").removeClass("active");
        }

        //点击 员工列表 导航时，显示对应的div
        function userInfoBar() {
            $("#allUserInfoDiv").attr("style", "display:block;");
            $("#addUserDiv").attr("style", "display:none;");
            $("#addUserBarLi").removeClass("active");
            $("#userInfoBarLi").addClass("active");
        }

        $(document).ready(function () {

            //确认删除用户
            $(".delUserConfirmed").click(function () {
                window.location.href = "<%=basePath%>" + "users/delUser?userid=" + $('#usernameToDelete').children("input:hidden").val();
            });

            //修改用户地址
            $(".changeAddressBt").click(function () {
                if ($(this).text() == "修改地址") {
                    $(this).parent().prev().children("input").removeAttr("readonly");
                    $(this).text("确认修改");
                } else {
                    $(this).parent().prev().children("input").attr("readonly", "readonly");
                    $(this).text("修改地址");
                    var address = $(this).parent().prev().children("input").val();
                    var userid = $(this).parent().prev().prev().prev().text();
                    window.location.href = "<%=basePath%>" + "users/updateUser?userid=" + userid + "&address=" + address;
                }
            });

            //查询用户
            $("#findByUsername").click(function () {
                var username = $(this).parent().children("div").children("input").val();
                window.location.href = "<%=basePath%>" + "users/findUser?username=" + username;
                //在form表单中，button的click事件，window.location.href后要加这条语句,
                // 否则不会跳转到指定页面，而会原页面刷新。
                window.event.returnValue = false;
            });

            //添加用户
            $("#addUserBt").click(function () {
                alert($("#newUsername").val() + ":" + $("#newAddress").val());
                window.location.href = "<%=basePath%>" + "users/addUser?username=" + $("#newUsername").val() + "&address=" + $("#newAddress").val();
                //在form表单中，button的click事件，window.location.href后要加这条语句,
                // 否则不会跳转到指定页面，而会原页面刷新。
                window.event.returnValue = false;
            });

        });

    </script>
</head>

<body>
<%--导航栏--%>
<nav class="navbar navbar-inverse navbar-static-top" role="navigation">
    <div class="container-fluid">
        <div class="navbar-header">
            <a class="navbar-brand" href="#">用户管理系统</a>
        </div>
        <div>
            <ul class="nav navbar-nav navbar-left">
                <li class="active" id="userInfoBarLi"><a href="javascript:userInfoBar();">员工列表</a></li>
                <li id="addUserBarLi"><a href="javascript:addUserBar();" id="addUserLink">增加员工</a></li>
            </ul>
            <form class="navbar-form navbar-right" role="search">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="请输入用户姓名">
                </div>
                <button type="submit" class="btn btn-default" id="findByUsername">查询</button>
            </form>
        </div>
    </div>
</nav>
<%--用户信息展示--%>
<div id="allUserInfoDiv">
    <table class="table table-hover table-striped">
        <thead>
        <tr>
            <th class="col-md-1">编号</th>
            <th class="col-md-1">姓名</th>
            <th class="col-md-6">住址</th>
            <th class="col-md-4">操作</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="user" items="${users}">
            <tr>
                <td class="col-md-1">${user.userid}</td>
                <td class="col-md-1">${user.username}</td>
                <td class="col-md-6"><input type="text" class="form-control" readonly="readonly"
                                            value="${user.address}">
                </td>
                <td class="col-md-4">
                    <button type="button" class="delUserBt btn btn-danger" data-toggle="modal"
                            data-target="#delUserModal"
                            onclick="values('${user.userid}','${user.username}','${user.address}')">删除用户
                    </button>
                    <!-- 用户删除确认的模态框（Modal） -->
                    <div class="modal fade" id="delUserModal" tabindex="-1" role="dialog"
                         aria-labelledby="delModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog">
                            <div class="modal-content">
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">
                                        &times;
                                    </button>
                                    <h4 class="modal-title" id="delModalLabel">
                                        确定删除该用户吗？
                                    </h4>
                                </div>
                                <div class="modal-body" id="usernameToDelete">
                                    <input type="hidden" value="">
                                    <p></p>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                                    <button type="button" class="btn btn-primary delUserConfirmed">确认删除</button>
                                </div>
                            </div><!-- /.modal-content -->
                        </div><!-- /.modal -->
                    </div>
                    <button type="button" class="btn btn-warning changeAddressBt">修改地址</button>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>

<%--添加用户--%>
<div id="addUserDiv" style="display: none">
    <form class="form-horizontal" role="form">
        <div class="form-group">
            <label for="newUsername" class="col-sm-2 control-label">姓名</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="newUsername"
                       placeholder="请输入姓名">
            </div>
        </div>
        <div class="form-group">
            <label for="newAddress" class="col-sm-2 control-label">住址</label>
            <div class="col-sm-10">
                <input type="text" class="form-control" id="newAddress"
                       placeholder="请输入住址">
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-offset-2 col-sm-10">
                <button class="btn btn-default" id="addUserBt">添加</button>
            </div>
        </div>
    </form>
</div>

</body>
</html>
