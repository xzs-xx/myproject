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
<title>Insert title here</title>
</head>
<body>
	<div class="head1"></div>
	<a href="childrenhome.do">首页></a>管理中心>
	<ul id="myTab" class="nav nav-tabs">
		<li class="active">
			<a href="#management_diary" data-toggle="tab">
				 日记管理
			</a>
		</li>
		<li><a href="#ios" data-toggle="tab">iOS</a></li>
		<li><a href="#jmeter" data-toggle="tab">iOS</a></li>
		<li><a href="#ejb" data-toggle="tab">iOS</a></li>
	</ul>
		<div class="tab-content">
			<div class="tab-pane fade in active" id="management_diary">
				<div class="management_diary" style="float:left;width:70%;">
					<h2 id="management_diary_time"></h2>
					<script type="text/javascript">
						var time =new Date();
						document.getElementById("management_diary_time").innerHTML="今天："+time.getFullYear()+"年"+time.getMonth()+"月"+time.getDate() +"日";
					</script>
					<div>
						<a href="#" class="btn btn-info btn-lg" onclick="managementdiaryPos()">
							<span class="glyphicon glyphicon-arrow-left" ></span>上一页
						</a>
						<a href="#" class="btn btn-info btn-lg" style="float:right;" onclick="managementdiaryNext()">
							<span class="glyphicon glyphicon-arrow-right"></span>下一页
						</a>
					</div>
					<span id="changepagediary">
						<c:if test="${diaryindex==-1}">
							<h3 align="center">首页，请点击下一页</h3>
						</c:if>
						<c:if test="${diaryindex == managementdiarys.size()}">
							<h3 align="center">最后一页，请点击上一页</h3>
						</c:if>
						<c:if test="${diaryindex>-1&&diaryindex<managementdiarys.size()}">
							<c:forEach var="diary" items="${sessionScope.managementdiarys}" varStatus="userStatus">
								<c:if test="${diaryindex==userStatus.index}">
									<h3 align="center">题目:<c:out value="${diary.title}"/></h3>
									<p id="putdiary"  align="center">${diary.text}</p>
									<p align="right">${diary.time}</p>
									<div id="sharingdiary">
										<c:if test="${diary.statu == 1}">
											<div style="width:100px;height:40px;float:right;background-color:grey;" onclick="sharingdiary('1')">
												<font size="6">已分享</font>
											</div>
										</c:if>
										<c:if test="${diary.statu == 0}">
											<div style="width:100px;height:40px;float:right;background-color:#3399FF;" onclick="sharingdiary('0')">
												<font size="6">未分享</font>
											</div>
										</c:if>
									</div>
								</c:if>
							</c:forEach>
						</c:if>
					</span>
					<script type="text/javascript">
						function sharingdiary(statu){
							$.ajax({
								type:"post",
								url:"management_diarystatu.do",
								data:{
									"statu":statu
								},	
								success:function(result){  					
									alert(result);
								}			
							}); 
						}
						
						function managementdiaryNext(){
							$.ajax({
								type:"post",
								url:"management_nextpage.do",
								data:{
								},	
								success:function(result){  					
									if(result[0]=="最后一页"){
										document.getElementById("changepagediary").innerHTML = '<h3 align="center">最后一页，请点击上一页</h3>';
									}else{
										document.getElementById("changepagediary").innerHTML =
											'<h3 align="center">题目:'+result[1]+'</h3>'+
											'<p id="putdiary"  align="center">'+result[2]+'</p>'+
											'<div id="sharingdiary">';
											//<p style="float:right;">${diary.time}</p>
											if(result[3]=="1"){
												document.getElementById("changepagediary").innerHTML+=
													'<div style="width:100px;height:40px;float:right;background-color:grey;" onclick="sharingdiary(\'1\')">'+
														'<font size="6">已分享</font>'+
													'</div>';
											}else{
												document.getElementById("changepagediary").innerHTML+=
													'<div style="width:100px;height:40px;float:right;background-color:#3399FF;" onclick="sharingdiary(\'0\')">'+
														'<font size="6">未分享</font>'+
													'</div>';
											}
											document.getElementById("changepagediary").innerHTML+='</div>';
									}
								}			
							}); 
						}
						function managementdiaryPos(){
							$.ajax({
								type:"post",
								url:"management_nextpos.do",
								data:{
								},	
								success:function(result){  					
									if(result[0]=="第一页"){
										document.getElementById("changepagediary").innerHTML = '<h3 align="center">第一页，请点击下一页</h3>';
									}else{
										document.getElementById("changepagediary").innerHTML =
											'<h3 align="center">题目:'+result[1]+'</h3>'+
											'<p id="putdiary"  align="center">'+result[2]+'</p>'+
											'<div id="sharingdiary">';
										if(result[3]=="1"){
											document.getElementById("changepagediary").innerHTML+=
												'<div style="width:100px;height:40px;float:right;background-color:grey;">'+
													'<font size="6">已分享</font>'+
												'</div>';
										}else{
											document.getElementById("changepagediary").innerHTML+=
												'<div style="width:100px;height:40px;float:right;background-color:#3399FF;">'+
													'<font size="6">未分享</font>'+
												'</div>';
										}
										document.getElementById("changepagediary").innerHTML+='</div>';
									}
								}			
							}); 
						}
					</script>
				</div>
			</div>
			<div class="tab-pane fade" id="ios">
				<p>iOS 是一个由苹果公司开发和发布的手机操作系统。最初是于 2007 年首次发布 iPhone、iPod Touch 和 Apple 
					TV。iOS 派生自 OS X，它们共享 Darwin 基础。OS X 操作系统是用在苹果电脑上，iOS 是苹果的移动版本。</p>
			</div>
			<div class="tab-pane fade" id="jmeter">
				<p>jMeter 是一款开源的测试软件。它是 100% 纯 Java 应用程序，用于负载和性能测试。</p>
			</div>
			<div class="tab-pane fade" id="ejb">
				<p>Enterprise Java Beans（EJB）是一个创建高度可扩展性和强大企业级应用程序的开发架构，部署在兼容应用程序服务器（比如 JBOSS、Web Logic 等）的 J2EE 上。
				</p>
			</div>
		</div>
</body>
</html>