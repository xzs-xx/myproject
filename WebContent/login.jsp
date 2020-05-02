<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<% String path = request.getContextPath();%>
<link rel="stylesheet" type="text/css" href="<%=path%>/mycss/login.css">
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src= "<%=path%>/myjavascript/login.js" type="text/javascript"></script>
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>儿童登录界面</title>
</head>
<body>
	<div class="login" style="top:10%;background-repeat: no-repeat;height:500px;">
		 <div class="input-group loginusername" >
            <span class="input-group-addon">账号</span>
            <input type="text" class="form-control" id="username" placeholder="用户名">
        </div>
         <div class="input-group loginpassword">
            <span class="input-group-addon">密码</span>
            <input type="password" class="form-control" placeholder="密码" id="password">
        </div>
        <button type="button" class="btn btn-primary buttonlogin" onclick="login()">登录</button>
        <button type="button" class="btn btn-primary buttonapply" onclick="apply()">注册</button>
	</div>
</body>
</html>