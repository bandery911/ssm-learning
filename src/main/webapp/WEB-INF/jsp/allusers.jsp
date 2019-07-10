<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<%@ include file="rootPath.jsp"%>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>ssm4</title>
    <script src="https://cdn.staticfile.org/jquery/2.0.0/jquery.min.js"></script>
    <script>

        $(document).ready(function(){

            //点击修改地址按钮，修改对应行用户的地址信息
            $(".changeAddressBt").click(function(){
                var userinfoHTML = $(this).parents("tr");
                //如果buttom是修改地址，则改变地址栏的属性为可修改，否则提交后台修改用户地址
                if($(this).val() == "修改地址"){
                    $(this).attr("value", "确认修改");
                    $(this).text("确认修改");
                    $(userinfoHTML.children("td").eq(2).find("input")).removeAttr("readonly");
                }else{
                    $(this).attr("value", "修改地址");
                    $(this).text("修改地址");
                    var userid = userinfoHTML.children("td").eq(0).find("input").val();
                    var newAddress = userinfoHTML.children("td").eq(2).find("input").val();
                    $(userinfoHTML.children("td").eq(2).find("input")).attr("readonly", "readonly");
                    window.location.href = "<%=basePath%>"+"users/updateUser?userid=" + userid + "&address=" + newAddress;
                }
            });

            //查找用户
            $("#findUserBt").click(function(){
                var username = $("#findUserText").val();
                window.location.href = "<%=basePath%>" + "users/findUser?username=" + username;
            });

            //增加用户
            $("#addUserBt").click(function () {
                var username = $(this).parents("div").find("input").val();
                var address = $(this).parents("div").find("input").eq(1).val();
                window.location.href = "<%=basePath%>" + "users/addUser?username=" + username + "&address=" + address;
            });

            //删除用户
            $(".delUserBt").click(function () {
                if(confirm("确认删除")){
                    var userid = $(this).parents("tr").children("td").eq(0).find("input").val();
                    window.location.href = "<%=basePath%>" + "users/delUser?userid=" + userid;
                }
            });

        });

    </script>
</head>

<body style="text-align: center">

<div>
    <input id="findUserText" type="text" placeholder="请输入用户名">
    <button value="查询" id="findUserBt">查询</button>
</div>
<br><br>
<div style="text-align: center">
<table id="userinfoTable" border="1" style="margin: auto">
    <tr>
        <th>编号</th>
        <th>姓名</th>
        <th>住址</th>
        <th colspan="2">操作</th>
    </tr>
    <c:forEach var="user" items="${users}">
        <tr>
            <td><input type="text" value="${user.userid}" readonly="readonly"/></td>
            <td><input type="text" value="${user.username}" readonly="readonly"/></td>
            <td><input type="text" value="${user.address}" readonly="readonly" autocomplete="off"/></td>
            <td><button class="delUserBt" value="删除用户">删除用户</button></td>
            <td><button class="changeAddressBt" value="修改地址">修改地址</button></td>
        </tr>
    </c:forEach>
</table>
</div>
<br><br>
<div>
    <input type="text" placeholder="输入姓名" autocomplete="off">&nbsp;
    <input type="text" placeholder="输入地址" autocomplete="off">
    <button value="增加" id="addUserBt">增加</button>
</div>

</body>
</html>

