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
<title>故事阅读</title>
</head>
<body>
	<div style="position:absolute;left:20%;width:60%;height:500px;">
		<img src="<%=path%>/myimage/故事阅读背景.jpg" width="100%" style="position:absolute;">
		<div id="storyput" style="position:absolute;font-size:30px;top:24%;left:10%;right:10%;">
			
		</div>
		<div  style="position:absolute;width:100%;top:500px;">
			<span class="glyphicon glyphicon-backward"
			  style="font-size: 70px;color: rgb(255, 191, 86);"
			  onclick="pos()"></span>
			<span class="glyphicon glyphicon-forward"  style="font-size: 70px;color: rgb(255, 191, 86);float:right;"
			onclick="next()"></span>
			<span class="glyphicon glyphicon-play"  
			style="font-size: 70px;color: rgb(255, 191, 86);margin-left:40%;"
			onclick="speakstory()"></span>
		</div>
	</div>
	
	<div style="position:absolute;width:20%;">
		<div data-spy="scroll" data-target="#navbar-example" data-offset="0"
     style="height:500px;overflow:auto; position: relative;">
     		<c:forEach var="story" items="${storys}" varStatus="status">
     			<diV onclick="readstory('<%=path%><c:out value="${story.storytextsrc}" />',
     			'<c:out value="${story.storyname}" />')">
	     			<img src="<%=path%>/story/storyimg/<c:out value="${story.srcimage}"/>"
	     			  class="img-thumbnail" width="100%">
	     			<p align="center"><c:out value="${story.storyname}" /></p>
     			</diV>
     		</c:forEach>
     	</div>
	</div>
	
	
	<script type="text/javascript" src="<%=path %>/myjavascript/entertainment_center_story.js">
	</script>
</body>
</html>