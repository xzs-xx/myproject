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
<link rel="stylesheet" type="text/css"
	href="<%=path%>/mycss/entertainment_center_video.css">
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>视频播放</title>
</head>
<body>
	<div style="position:absolute;left:20%;width:80%;height:500px;">
		<img src="<%=path%>/myimage/视频背景.jpg" width="100%" style="position:absolute;">
		<div id="sreenchange" style="position:absolute;width:40%;left:23%;top:19%;">
			<video id="video1" width="100%">
				<source src="<%=path%>/video/video/小马过河.mp4" type="video/mp4">
				<source src="<%=path%>/video/video/小马过河.mp4" type="video/ogg">
			</video>
			<div style="width:100%;">
				<input type="range" value="0" id="videorange" onclick="progresschange()">
				<span class="glyphicon glyphicon-play" id="playvideo" onclick="playPause()"></span>
				<span class="glyphicon glyphicon-pause" style="display:none;" id="pausevideo" onclick="playPause()"></span>
				<span class="glyphicon glyphicon-fullscreen" style="float:right;" onclick="changescreen()"></span>
			</div>
		</div>
	</div>
	<div style="position:absolute;width:20%;">
		<div data-spy="scroll" data-target="#navbar-example" data-offset="0"
	     style="height:500px;overflow:auto; position: relative;">
			<c:forEach var="video" items="${videos}" varStatus="status">
				<div>
					<img src="<%=path%>/video/image/<c:out value="${video.imgsrc}"/>"
			     			  class="img-thumbnail" width="100%">
				</div>
			</c:forEach>
		</div>
	</div>
<script
	src="<%=path%>/myjavascript/entertainment_center_video.js"></script>
</body>
</html>