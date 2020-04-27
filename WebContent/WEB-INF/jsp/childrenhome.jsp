<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<% String path=request.getContextPath(); %>
<link rel="stylesheet" type="text/css" href="<%=path %>/mycss/childrenhome.css">
<title>Insert title here</title>
<script type="text/javascript" src="<%=path %>/myjavascript/childrenhome.js"></script>

<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div id="head1" class="head1">
		<div class="head1_children">个人信息</div>
		<div class="head1_parent">家长信息</div>
	</div>
	<p>首页></p>
	<div id="mid" class="mid">
		<div id="myCarousel" class="carousel slide">
			<!-- 轮播（Carousel）指标 -->
			<ol class="carousel-indicators">
				<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
				<li data-target="#myCarousel" data-slide-to="1" ></li>
				<li data-target="#myCarousel" data-slide-to="2"></li>
				<li data-target="#myCarousel" data-slide-to="3"></li>
				<li data-target="#myCarousel" data-slide-to="4"></li>
				<li data-target="#myCarousel" data-slide-to="5"></li>
			</ol>   
			<!-- 轮播（Carousel）项目 -->
			<div class="carousel-inner">
				<div class="item active"  onclick="personal()" align="center">
					<img src="<%=path %>/myimage/个人主页.jpg" width="400" height="400">
					个人中心
				</div>
				<div class="item" onclick="entertainment()" align="center">
					<img src="<%=path %>/myimage/娱乐中心.jpg" width="400" height="300">
					娱乐中心
				</div>
				<div class="item" onclick="management()" align="center">
					<img src="<%=path %>/myimage/管理中心.jpg" width="450" height="300">
					管理中心
				</div>
				<div class="item" onclick="sharing()" align="center">
					<img src="<%=path %>/myimage/分享中心.jpg" width="400" height="300">
					分享中心
				</div>
				<div class="item" onclick="study()" align="center">
					<img src="<%=path %>/myimage/学习中心.jpg" width="400" height="300">
					学习中心
				</div>
				<div class="item" onclick="creative()" align="center">
					<img src="<%=path %>/myimage/创意中心.jpg" width="330" height="300">
					创意中心
				</div>
			</div>
			<!-- 轮播（Carousel）导航 -->
			<a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
				<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a>
			<a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
	</div>
	<div id="end" class="end"></div>
</body>
</html>