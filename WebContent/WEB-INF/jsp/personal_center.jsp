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
<title>个人中心</title>
<link rel="stylesheet" type="text/css"
	href="<%=path%>/mycss/personal_center.css">
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body class="mybody">
	<div class="mycollection">
		<div class="mytitle">
			你的收藏
		</div>
		<p align="center" id="collectiontitle"
		 style="font-size:20px;text-shadow: 5px 5px 5px rgba(240,255,255,1);"></p>
		 <div data-spy="scroll" data-target="#navbar-example" data-offset="0"
     		style="height:200px;overflow:auto; position: relative;">
			<p id="collectiontext" style="text-shadow: 5px 5px 5px rgba(240,255,255,1);">
			</p>
		</div>
		<p style="float:right;">
			告诉
			<span id="collectionusername"></span>：
			<span class="glyphicon glyphicon-comment" style="color:red;" onclick="showspeak()"></span>
		</p>
		<div id="speakcollection" style="display:none;">
			<div class="input-group"  style="float:right;">
	            <span class="input-group-addon">消息</span>
	            <input type="text" class="form-control" id="pspeaktext">
	            <span class="input-group-addon" onclick="onspeak()">发送</span>
	        </div>
	     </div>
	</div>
	
	
	<div class="mylist">
	<span class="glyphicon glyphicon-user"  data-toggle="modal" data-target="#myModal"></span>
	<span class="badge" id="personal_size" style="margin-left:-30px;margin-top:-80px;">
	 	<c:out value="${fanssize}"/>
	</span>
	<!-- 模态框（Modal） -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" 
		aria-hidden="true" style="font-size:10px;">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
						&times;
					</button>
					<h4 class="modal-title" id="myModalLabel" align="center">
						聊天对话框
					</h4>
				</div>
				<div class="modal-body" style="height:350px;">
					<div style="width:60%;position:absolute;">
						<div data-spy="scroll" data-target="#navbar-example" data-offset="0"
	     					style="height:350px;overflow:auto; position: relative;">
							<div id="communicationput">
								
							</div>
						</div>
					</div>
					<div style="position:absolute;left:70%;">
						<div data-spy="scroll" data-target="#navbar-example" data-offset="0"
     						style="height:350px;overflow:auto; position: relative;">
							<p>关注</p>
							<c:forEach var="fan" items="${fans}" varStatus="userStatus">
								<p  onclick="setcommunicationname('${fan.fansusername}')">
									<c:out value="${fan.fansusername}"/>
									<span class="badge" id="personal_size" style="background-color:red;">
										<span class="fanshave"></span>
										<script type="text/javascript">
											$.ajax({
											type:"post",
											url:"findCommunicationsize.do",
											data:{
												"activeusername":'${fan.fansusername}'
											},	
											success:function(result){
												document.getElementsByClassName("fanshave")['${userStatus.index}'].innerHTML =
												result;
											}			
											}); 
										</script>
									</span>	
								</p>
							</c:forEach>
							<p>粉丝</p>
							<c:forEach var="befan" items="${befans}" varStatus="userStatus">
								<p  onclick="setcommunicationname('${befan.username}')">
									<c:out value="${befan.username}"/>
									<span class="badge" id="personal_size" style="background-color:red;">
										<span class="befanshave"></span>
										<script type="text/javascript">
										$.ajax({
											type:"post",
											url:"findCommunicationsize.do",
											data:{
												"activeusername":'${befan.username}'
											},	
											success:function(result){
												document.getElementsByClassName("befanshave")['${userStatus.index}'].innerHTML
													=result;
											}			
										}); 
										</script>
									</span>
								</p>
							</c:forEach>
						</div>
					</div>
				</div>
				<div class="modal-footer">
					<div class="input-group">
			            <span class="input-group-addon">消息</span>
			            <input type="text" class="form-control" id="communicationtext"">
			            <span class="input-group-btn">
							<button type="button" class="btn btn-primary" onclick="communicationspeak()">
								发送
							</button>
						</span>
			        </div>
				</div>
			</div><!-- /.modal-content -->
		</div><!-- /.modal -->
	</div>	
		
			 
	<span class="glyphicon glyphicon-chevron-left"  onclick="pospage(-1)"></span>
	<span class="glyphicon glyphicon-chevron-right" onclick="pospage(1)"></span>
	<span class="glyphicon glyphicon-heart" style="color:red;" onclick="delcollection()"></span>
	</div>
	
	
	
	
	<div class="myselect">
		<div id="putdiary" style="width:80px;float:left;">
			<img src="./myimage/日记.jpg" class="img-circle" height="80px">
		</div>
		<div id="putcomposition" style="width:80px;float:left;display:none;">
			<img src="./myimage/作文.jpg" class="img-circle" height="80px">
		</div>
		<div id="putimage" style="width:80px;float:left;display:none;">
			<img src="./myimage/日常.jpg" class="img-circle" height="80px">
		</div>
		<p id="putselect"></p>
	</div>
	<div class="myspeak" id="putspeak">
		<img src="./myimage/白云对话框.png" class="img-circle" height="80px" style="opacity:0.6;filter:alpha(opacity=60);">
		<p align="center" style="margin-top:-60px;" id="putspeaktext">评论语句显示</p>
	</div>
	
	<script type="text/javascript" src="<%=path %>/myjavascript/personal_center.js"></script>
	<c:forEach var="usercollection1" items="${sessionScope.usercollection}" varStatus="status">
		<script type="text/javascript">
			addusercollection(
			'<c:out value="${usercollection1.id}"/>',
			'<c:out value="${usercollection1.collectionuser}"/>',
			'<c:out value="${usercollection1.collectionid}"/>',
			'<c:out value="${usercollection1.collectiontype}"/>',
			'<c:out value="${usercollection1.collectiontime}"/>'
			);
		</script>
	</c:forEach>
</body>
<script>
	initpath("<%=path %>");
	init();
	initwebsocket("${sessionScope.username}");
	setInterval(websocket, 3000);
	
</script>
</html>
