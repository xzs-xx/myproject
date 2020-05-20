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
	href="<%=path%>/mycss/personal_center.css">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://cdn.staticfile.org/jquery/2.1.1/jquery.min.js"></script>
<script
	src="https://cdn.staticfile.org/twitter-bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<div class="head1"></div>
	<p><a href="childrenhome.do">首页></a>个人主页></p>
	<div class="mid">
		<ul id="myTab" class="nav nav-tabs">
			<li class="active"><a href="#personalcollection" data-toggle="tab">收藏内容 </a></li>
			<li><a href="#communication" data-toggle="tab">信息交流</a></li>
		</ul>
		<div id="myTabContent" class="tab-content">
			<div class="tab-pane fade in active" id="personalcollection">
				<div class="panel panel-default">
					<div class="panel-heading">
						收藏内容 
						 <span class="badge" id="personal_size">
								${usercollectionsize}
						</span>
					</div>
					<div class="panel-body">
						<div style="width:70%;float:left;">
							<a href="#" class="btn btn-info btn-lg" onclick="collectionpos(-1)">
								<span class="glyphicon glyphicon-arrow-left" ></span>上一页
							</a>
							<a href="#" class="btn btn-info btn-lg" style="float:right;" onclick="collectionpos(1)">
								<span class="glyphicon glyphicon-arrow-right"></span>下一页
							</a>
							<h3 id="collectiontitle"  align="center"></h3>
							<p id="collectiontext" align="center"></p>
							<p id="collectionusername" align="right"></p>
						</div>
						<div style="width=30%;float:left;">
							<div>
								<div style="margin-left:50px">
									日记
									<span class="badge" id="personal_size">
										${collectiondiarysize}
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>	
				<script   type="text/javascript">
					var collectionindex = -1;
					function collectionpos(pos){
						$.ajax({
							type:"post",
							url:"seeusercollection.do",
							data:{
								"collectionindex":collectionindex+pos
							},	
							success:function(result){
								if(result[0] == "成功"){
									if(result[4] = "diary"){
										collectionindex=collectionindex+pos;
										document.getElementById("collectiontitle").innerHTML = result[1];
										document.getElementById("collectiontext").innerHTML = result[2];
										document.getElementById("collectionusername").innerHTML = result[3];
									}
								}else{
									alert(result[0]);
								}
							}		
						});
					}
				</script>
				
			</div>
			<div class="tab-pane fade" id="communication">
				<div class="panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">
							聊天交流
						</h3>
					</div>
					<div class="panel-body">
						<div style="height:280px;width:50%;float:left">
							<div style="height:230px;border-style:solid;border-width:5px;">
								说话虽然简单，但可不是一件小事。说什么话，很重要。用简单的话去伤害别人，可能造成的后果很大。用简单的语言去温暖这个世界，可能给人带来的就是一时、一天乃至一生的帮助。
							</div>
						</div>
						<div style="width:50%;float:left;">
						
						
							<ul class="nav nav-tabs">
								<li class="active">
									<a href="#fans" data-toggle="tab">
										粉丝
										<span class="badge" id="personal_size">
											${fanssize}
										</span>
									</a>
								</li>
								<li>
									<a href="#befans" data-toggle="tab">
										关注
										<span class="badge" id="personal_size">
											${befanssize}
										</span>
									</a>
								</li>
							</ul>
							<div class="tab-content">
								<div class="tab-pane fade in active" id="fans">
									<c:forEach var="fan" items="${fans}" varStatus="userStatus">
									<div class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal"
										 onclick="setcommunicationname('${fan.fansusername}')">
										<p data-toggle="tooltip" data-placement="right" title="点击与他聊天" > 
											${fan.fansusername}
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
									</div>	
									</c:forEach>

								</div>
								
								<div class="tab-pane fade" id="befans">
									<c:forEach var="befan" items="${befans}" varStatus="userStatus">
										<div class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal"
										 	onclick="setcommunicationname('${befan.username}')">
										 	${befan.username}
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
										 </div>
									</c:forEach>
								</div>
								
								
								<!-- 模态框（Modal） -->
									<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
										 aria-labelledby="myModalLabel" aria-hidden="true">
										<div class="modal-dialog">
											<div class="modal-content">
												<div class="modal-header">
													<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
														&times;
													</button>
													<h4 class="modal-title" id="myModalLabel">
														消息发送框
													</h4>
												</div>
												<div class="modal-body" id="communicationput">
													
												</div>
												<div class="modal-footer">
													<div class="input-group input-group-sm">
														<input type="text" class="form-control" id="communicationtext">
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
									
									<script type="text/javascript">
									var speakname = null;
									function returncommunication(){
										$.ajax({
											type:"post",
											url:"findCommunication.do",
											data:{
												"activeusername":speakname
											},	
											success:function(result){
												var i = 0;
												document.getElementById("communicationput").innerHTML = "";
												for(i=0;i<result.length;i++){
													if(result[i].activeusername==speakname){
														document.getElementById("communicationput").innerHTML +=
															"<p align='left'>" + result[i].speaktext + "</p>";
													}else{
														document.getElementById("communicationput").innerHTML +=
															"<p align='right'>" + result[i].speaktext + "</p>";
													}
												}
											}			
										}); 
									}
									function setcommunicationname(gospeakname){
										speakname = gospeakname;
										returncommunication();
									}
									function communicationspeak(){
										$.ajax({
											type:"post",
											url:"communicationspeak.do",
											data:{
												"activeusername":speakname,
												"communicationtext":$("#communicationtext").val()
											},	
											success:function(result){
												document.getElementById("communicationput").innerHTML+=
													"<p align='right'>" + $("#communicationtext").val() +"</p>";
												$("#communicationtext").val("");
											}			
										}); 
									}
									</script>
							</div>
							
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>