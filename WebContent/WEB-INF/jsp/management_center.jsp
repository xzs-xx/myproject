<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	String path = request.getContextPath();
%>
<link rel="stylesheet" type="text/css"
	href="<%=path%>/mycss/management_center.css">
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>管理中心</title>
</head>
<body>
	<div  style="position:absolute;font-size:50px;left:30%;">
		<span id="puttop">日记</span>
		 <span class="glyphicon glyphicon-star"style="color:black;" id="shareboolean" onclick="changestatu()"></span>
	</div>
	<img src="<%=path%>/myimage/管理界面.jpg" width="80%" style="position:absolute;top:10%;">
	<div  style="position:absolute;left:80%;width:20%;">
	
		<div class="panel-group" id="accordion" style="width:100%">
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" 
						   href="#collapseOne">
							日记
						</a>
					</h4>
				</div>
				<div id="collapseOne" class="panel-collapse collapse in">
					<div class="panel-body">
						<div data-spy="scroll" data-target="#navbar-example" data-offset="0"
     						style="height:200px;overflow:auto; position: relative;">
							<c:forEach var="userdiary" items="${userdiarys}" varStatus="userStatus">
								<p align="center" style="font-size:20px;" onclick="putdiary('<c:out value='${userStatus.index}'/>')">
									<c:out value="${userdiary.title}"/>
								</p>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" 
						   href="#collapseTwo">
							作文
						</a>
					</h4>
				</div>
				<div id="collapseTwo" class="panel-collapse collapse">
					<div class="panel-body">
						<div data-spy="scroll" data-target="#navbar-example" data-offset="0"
     						style="height:200px;overflow:auto; position: relative;">
     						<c:forEach var="composition" items="${compositions}" varStatus="compositionStatus">
								<p align="center" style="font-size:20px;"
								 onclick="putcomposition('<c:out value='${compositionStatus.index}'/>')">
									<c:out value="${composition.title}"/>
								</p>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
			
			<div class="panel panel-default">
				<div class="panel-heading">
					<h4 class="panel-title">
						<a data-toggle="collapse" data-parent="#accordion" 
						   href="#collapseThree" >
							瞬间
						</a>
					</h4>
				</div>
				<div id="collapseThree" class="panel-collapse collapse">
					<div class="panel-body">
						<div data-spy="scroll" data-target="#navbar-example" data-offset="0"
     						style="height:200px;overflow:auto; position: relative;">
							<c:forEach var="shareimage" items="${shareimages}" varStatus="shareimageStatus">
								<p align="center" style="font-size:20px;" onclick="putshareimage('<c:out value='${shareimageStatus.index}'/>')">
									<c:out value="${shareimage.title}"/>
								</p>
							</c:forEach>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div>
			<div data-spy="scroll" data-target="#navbar-example" data-offset="0"
	     		style="height:200px;overflow:auto; position: relative;">
				<p align="center">评论内容</p>
				<div id="adddiarycomment">
				</div>
			</div>
		</div>
		
		
	</div>
	
	<div style="position:absolute;width:40%;left:20%;top:30%;">
		<div align="center" style="font-size:20px;">
			标题:
			<span id="managementtitle"></span>
		</div>
		<div>
			<div data-spy="scroll" data-target="#navbar-example" data-offset="0"
	     						style="height:200px;overflow:auto; position: relative;">
				<div id="managementtext" style="text-indent:30px">
					
				</div>
			</div>
		</div>
	</div>
	
	
</body>
<script src="<%=path%>/myjavascript/management_center.js">
</script>
<script type="text/javascript">
	setpath('<%=path%>');
</script>
</html>