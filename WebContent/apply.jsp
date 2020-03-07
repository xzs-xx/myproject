<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>

<html>
<head>
<link rel="icon" href="./common/images/favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="./mycss/apply.css">
<script src="./common/js/jquery-2.1.4/jquery-1.8.0.min.js"></script>
<script src="./common/js/jquery-2.1.4/layer/layer.js"></script>
<script type="text/javascript" src="./myjavascript/apply.js"></script>
<meta charset="UTF-8">
<title>注册</title>
</head>
<script type="text/javascript">
	function apply() {
		var pos;
		if (document.getElementById("parents").style.color == "blue") {
			pos = 3;
		} else if (document.getElementById("admin").style.color == "blue") {
			pos = 2;
		} else
			pos = 1;
		//alert($("#password").val());
		$.ajax({
			type : "post",
			url : "apply.do",
			data : {
				"username" : $("#username").val(),
				"password" : $("#password").val(),
				"email"    : $("#email").val(),
				"tel"      : $("#tel").val(),
				"portrait" : null,
				"pos"      : pos
			},
			dataType:"text",
			success:function(result) {
				//追加默认还原
				$("#username").val("");
				$("#password").val("");
				if (result == "1") {
					layer.msg("注册成功"), setTimeout(function() {
						window.location = "login.jsp";
					}, 3000);
				} else {
					layer.msg(result), setTimeout(function() {
						window.location = "apply.jsp";
					}, 3000);
				}
			},
			error:function(error){
				alert(error);
			}
		});
	}
</script>
<body>
	<div id="head" class="head">
		<div id="children" class="children" onclick="childrento()">儿童</div>
		<div id="admin" class="admin" onclick="admin()">管理员</div>
		<div id="parents" class="parents" onclick="parents()">家长</div>
		<form action="apply.do" method="post">
			<p class="apply1">
				<input class="username" id="username" type="text" name="username"
					placeholder="姓名">
			</p>
			<p class="apply2">
				<input class="password" id="password" type="password"
					name="password" placeholder="密码">
			</p>
			<p class="apply3">
				<input class="email" id="email" type="email" name="email"
					placeholder="邮箱">
			</p>
			<p class="apply4">
				<input class="tel" id="tel" type="tel" name="tel" placeholder="电话">
			</p>
			<p class="apply5"><button type="button" value="立刻注册" onclick="apply()">立刻注册</button></p>
		</form>
	</div>
</body>
</html>