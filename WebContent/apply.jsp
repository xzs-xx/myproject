<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<% String path = request.getContextPath();%>
<link rel="stylesheet" type="text/css" href="./mycss/apply.css">
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="./myjavascript/apply.js"></script>
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>注册页面</title>
</head>
<body class="bodybackground">
	<div class="applyframe">
		<button type="button" id="children" onclick="childrenchange()" class="btn btn-default children"
			style="background:rgba(255,255,255,0.5);">儿童注册</button>
		<button type="button" id ="momandfad" onclick="adminchange()" class="btn btn-default momandfad">家长注册</button>
		<div class="input-group" style="width:80%;margin-top:10%;margin-left:10%">
            <span class="input-group-addon">用户</span>
            <input id ="username" type="text" class="form-control" placeholder="用户">
        </div>
        <div class="input-group"  style="width:80%;margin-top:10%;margin-left:10%">
            <span class="input-group-addon">密码</span>
            <input id ="password" type="password" class="form-control" placeholder="密码">
        </div>
        <div class="input-group"  style="width:80%;margin-top:10%;margin-left:10%">
            <span class="input-group-addon">邮箱</span>
            <input id ="email" type="text" class="form-control" placeholder="邮箱">
        </div>
        <div class="input-group"  style="width:80%;margin-top:10%;margin-left:10%">
            <span class="input-group-addon">电话</span>
            <input id = "tel" type="text" class="form-control" placeholder="电话">
        </div>
        <button type="button" class="btn btn-primary buttonlogin" onclick="apply()" style="width:80%;margin-top:10%;margin-left:10%">注册</button>
	</div>
</body>
</html>