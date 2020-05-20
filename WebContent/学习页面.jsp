<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script  type="text/javascript"
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script  type="text/javascript"
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>学习页面</title>
</head>
<body style="background-image: url(;
	background-color:rgb(0,250,154);
	background-size:100% auto;
	background-repeat: no-repeat;">
	<img src="./myimage/阅读课本.jpg"  width="100%" height="650px" style="position:absolute;">
	<div style="width:300px;height:300px;position:absolute;top:10%;
			opacity:0.6;
			filter:alpha(opacity=60);">
		<img src="./myimage/气球2.png"  width="100%" height="100%" style="position:absolute;">
		<div   style="position:absolute;width:200px;left:50px;top:30px;text-align:center;font-size:20px;">
			<p>金目水火土</p>
		</div>
	</div>
	<div style="width:600px;height:460px;background-color:rgba(221,160,221,0.4);position:absolute;left:30%;top:20%;">
		<div style="width:300px;float:left;">
			<img src="./课本/苏教版语文一年级下册/1.jpg"  class="img-thumbnail" width="300px" height="400px">
			<div class="input-group" style="background-color:rgba(221,160,221,0.4);">
			 	<span class="glyphicon glyphicon-circle-arrow-left" style="font-size: 37px;float:left;"> </span>
	            <span class="input-group-addon">笔记</span>
	            <input type="text" class="form-control">
	            <span class="input-group-addon">保存</span>
	            <span class="glyphicon glyphicon-circle-arrow-right" style="font-size: 37px;float:right;"></span>
        	</div>
		</div>
		<div style="float:left;width:300px;height:460px;">
			<div style="width:300px;height:422px;">
				<h3 align="center">笔记显示</h3>
				<p>金目水火土</p>
			</div>
		</div>
	</div>
</body>
</html>