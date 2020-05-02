<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<%
	String path = request.getContextPath();
%>
<script type="text/javascript" src="<%=path %>/myjavascript/entertainment_center.js"></script>
<link rel="stylesheet" type="text/css"
	href="<%=path%>/mycss/entertainment_center.css">
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>娱乐选择中心</title>
</head>
<body>
	<div>
		<div class="entertainmentleft">
			<img src="<%=path %>/myimage/胡图图.png" class="entertainmenthututu">
		</div>
		<div class="entertainmentmid">
			<img src="<%=path %>/myimage/娱乐界面.jpg" class="entertainmentmidback">
			<img src="<%=path %>/myimage/娱乐界面提示.png" class="entertainmentmidTips">
			<img src="<%=path %>/myimage/音乐透明.png"  class="entertainmentmidMusic">
			<img src="<%=path %>/myimage/看故事.png" class="entertainmentmidStory">
			<img src="<%=path %>/myimage/视频播放.png" class="entertainmentmidVideo">
		</div>
	</div>
</body>
</html>