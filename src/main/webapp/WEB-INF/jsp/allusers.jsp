<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<html>
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
            $('#usernameToDelete').html(username + "&emsp;&emsp;" + address);
        }

        $(document).ready(function () {

            //确认删除用户
            $(".delUserConfirmed").click(function () {
                alert("用户已删除");
            });

            //修改用户地址
            $(".changeAddressBt").click(function () {
                //alert($(this).text());
                if ($(this).text() == "修改地址") {
                    $(this).parent().prev().children("input").removeAttr("readonly");
                    $(this).text("确认修改");
                } else {
                    $(this).parent().prev().children("input").attr("readonly", "readonly");
                    $(this).text("修改地址");
                    alert("修改成功");
                }
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
                <li class="active"><a href="#">员工列表</a></li>
                <li><a href="#">增加员工</a></li>
            </ul>
            <form class="navbar-form navbar-right" role="search">
                <div class="form-group">
                    <input type="text" class="form-control" placeholder="请输入用户姓名">
                </div>
                <button type="submit" class="btn btn-default">查询</button>
            </form>
        </div>
    </div>
</nav>
<%--用户信息表展示--%>
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
            <td class="col-md-6"><input type="text" class="form-control" readonly="readonly" value="${user.address}">
            </td>
            <td class="col-md-4">
                <button type="button" class="delUserBt btn btn-danger" data-toggle="modal" data-target="#delUserModal"
                        onclick="values('${user.userid}','${user.username}','${user.address}')">删除用户
                </button>
                <!-- 用户删除确认的模态框（Modal） -->
                <div class="modal fade" id="delUserModal" tabindex="-1" role="dialog" aria-labelledby="delModalLabel"
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
</body>
</html>
