<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<% String path = request.getContextPath();%>
<link rel="stylesheet" href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>个人页面</title>
</head>
<body style="
	background-image: url(./myimage/个人界面背景图.jpg);
	background-color:rgb(0,250,154);
	background-size:100% auto;
	background-repeat: no-repeat;">
	<div style="
	background-color:rgba(135,206,235,0.4);
	width:400px;
	height:300px;
	position:absolute;
	left:40%;
	top:8%;
	">
		<div style="
		background-color:rgba(135,206,235,0.8);
		text-shadow: 5px 5px 5px rgba(240,255,255,1);
		">
			你的收藏
		</div>
		<p align="center" style="font-size:20px;text-shadow: 5px 5px 5px rgba(240,255,255,1);">题目:充满希望的一天</p>
		<p style="text-shadow: 5px 5px 5px rgba(240,255,255,1);">
		中秋节，我和爸爸妈妈回到外婆家和外婆一家吃团圆饭。下午，我们一家和舅舅一家去钓鱼。
		<br>
		我们带上账篷、鱼竿、零食，开车前住滁河边上。长长的芦苇在秋风的吹拂下摆动着婀娜的身姿，池塘里散落着许多调皮的菱角，让舅舅的鱼钩不知要甩在何处。妈妈和舅妈搭好账篷和小妹妹一起聊天看我们钓鱼。只见爸爸打开蚯蚓盒，里面有很多扭动身子的小蚯蚓，爸爸用食指和姆指小心地捏住蚯蚓的头部，轻轻放在手心，再用右手击打左手，把蚯蚓拍晕后钩在鱼钩上。
		爸爸拉长鱼竿，用力抛向远处，接着他又在鱼线周围洒了许多鱼食，接下来就是等待了。远处，舅舅也在等鱼儿上钩。
		</p>
		<p style="float:right;">告诉作者：<span class="glyphicon glyphicon-comment" style="color:red;"></span></p>
	</div>
	<div style="position:absolute;
				top:82%;
				width:30%;
				height:15%;
				font-size:60px;
	">
	<span class="glyphicon glyphicon-user"></span>
	 <span class="badge" id="personal_size" style="margin-left:-30px;margin-top:-80px;">0</span>
						 
		<span class="glyphicon glyphicon-chevron-left"></span>
		<span class="glyphicon glyphicon-chevron-right"></span>
		<span class="glyphicon glyphicon-heart" style="color:red;"></span>
	</div>
	<div style="position:absolute;
				top:82%;
				left:30%;
				width:30%;
				height:15%;
				font-size:60px;">
				<div style="width:80px;float:left;display:none;">
					<img src="./myimage/日记.jpg" class="img-circle" height="80px">
				</div>
				<div style="width:80px;float:left;">
					<img src="./myimage/日记.jpg" class="img-circle" height="80px">
				</div>
				<div style="width:80px;float:left;display:none;">
					<img src="./myimage/日常.jpg" class="img-circle" height="80px">
				</div>
				<p>日记</p>
	</div>
	<div style="position:absolute;left:5%;
			width:400px;">
		<img src="./myimage/白云对话框.png" class="img-circle" height="80px" style="
			opacity:0.6;
			filter:alpha(opacity=60);">
		<p align="center" style="margin-top:-60px;">这个作品很好</p>
	</div>
</body>
</html>