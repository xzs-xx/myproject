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
	href="<%=path%>/mycss/entertainment_center.css">
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Insert title here</title>
</head>
<body onload="playPause()">
	<div class="head1"></div>
	<p>
		<a href="childrenhome.do">首页></a><a href="entertainment_center.do">娱乐中心></a>观看故事
	</p>
	<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">
			视频:<c:out value="${sessionScope.videotitle}"/>
		</h3>
		</div>
		<div class="panel-body">
			<div style="text-align:center"> 
				<diV>
					<button onclick="playPause()">播放/暂停</button> 
					<button onclick="makeBig()">放大</button>
					<button onclick="makeSmall()">缩小</button>
					<button onclick="makeNormal()">普通</button>
				</div>
				<div>
					<video id="video1" width="420">
						<source src="<%=path%><c:out value="${sessionScope.videosrc}"/>" type="video/mp4">
						<source src="<%=path%><c:out value="${sessionScope.videosrc}"/>" type="video/ogg">
					</video>
				</div>
			</div>
		</div>
	</div>	
	
	<script >
		var myVideo=document.getElementById("video1"); 
		function playPause(){ 
		if (myVideo.paused) myVideo.play(); 
		else myVideo.pause(); 
		} 
		function makeBig(){ 
		myVideo.width=560; 
		} 
		function makeSmall(){ 
		myVideo.width=320; 
		} 
		function makeNormal(){ 
		myVideo.width=420; 
		} 
	</script>
</body>
</html>