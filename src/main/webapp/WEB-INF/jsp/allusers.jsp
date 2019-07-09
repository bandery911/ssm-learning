<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>ssm3</title>
</head>

<body>

<table border="1">
    <tr>
        <th>Id</th>
        <th>Name</th>
        <th>Address</th>
        <th colspan="2">操作</th>
    </tr>
    <c:forEach var="user" items="${users}">
        <tr>
            <td>${user.userid}</td>
            <td>${user.username}</td>
            <td>${user.address}</td>
            <td><a href="./delUser?userid=${user.userid}">删除</a></td>
            <td><a href="">修改地址</a></td>
        </tr>
    </c:forEach>
</table>

</body>
</html>

