<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<% String path=request.getContextPath(); %>
<link rel="stylesheet" type="text/css" href="<%=path %>/mycss/childrenhome.css">
<title>Insert title here</title>
<script type="text/javascript" src="<%=path %>/myjavascript/childrenhome.js"></script>
</head>
<body>
	<div id="head1" class="head1">
		<div class="head1_children">个人信息</div>
		<div class="head1_parent">家长信息</div>
	</div>
	<p>首页></p>
	<div id="mid" class="mid">
		<div class="personal_center" onclick="personal()">个人中心</div>
		<div class="Entertainment_center" onclick="entertainment()">娱乐中心</div>
		<div class="management_center">管理中心</div>
		<div class="Sharing_center" onclick="sharing()">分享中心</div>
		<div class="Learning_center">学习中心</div>
		<div class="Creative_center" onclick="creative()">创意中心</div>
	</div>
	<div id="end" class="end"></div>
</body>
</html>