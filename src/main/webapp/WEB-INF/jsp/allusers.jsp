<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>ssm3</title>
    <script src="https://cdn.staticfile.org/jquery/2.0.0/jquery.min.js"></script>
    <script>

        $(document).ready(function(){
            $("button").click(function(){
                var useridHTML = $(this).parents("tr").children("td:first").html();
                var userid = $(useridHTML).attr("value");
                alert(userid);
            });
        });

    </script>
</head>

<body>

<table id="userinfoTable" border="1">
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Address</th>
        <th colspan="2">操作</th>
    </tr>
    <c:forEach var="user" items="${users}">
        <tr>
            <td><input type="text" value="${user.userid}" readonly="readonly" class="userinfo"/></td>
            <td><input type="text" value="${user.username}" readonly="readonly"/></td>
            <td><input type="text" value="${user.address}" readonly="readonly"/></td>
            <td><a href="./delUser?userid=${user.userid}">删除</a></td>
            <td><button>修改地址</button></td>
        </tr>
    </c:forEach>
</table>

</body>
</html>

