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
<body  onload="storychange('<%=path%><c:out value="${sessionScope.storysrc}"/>')">
	<div class="head1"></div>
	<p>
		<a href="childrenhome.do">首页></a><a href="entertainment_center.do">娱乐中心></a>观看故事
	</p>
	<div class="panel panel-default">
	<div class="panel-heading">
		<h3 class="panel-title">
			题目:<c:out value="${sessionScope.storyname}"/>
		</h3>
		</div>
		<div class="panel-body">
			<p id="storyput"></p>
		</div>
	</div>	
	<script>
		function storychange(src){
		alert(src);
		var request=null;
		if(window.XMLHttpRequest){
			request=new XMLHttpRequest();
		}else if(window.ActiveXObject){
			request=new ActiveXObject("Microsoft.XMLHTTP");
		}
		if(request){
			request.open("GET",src,true);
			request.onreadystatechange=function(){
			if(request.readyState===4){
				if (request.status == 200 || request.status == 0){
					var str=request.responseText;
					document.getElementById("storyput").innerHTML="";
					str.trim().split('\n').forEach(function(v, i) {
						document.getElementById("storyput").innerHTML+="<p>"+v+"</p>";
					})
				}
			}
		}
		request.send(null);
		}else{
			alert("error");
		}
		}
	</script>
</body>
</html>