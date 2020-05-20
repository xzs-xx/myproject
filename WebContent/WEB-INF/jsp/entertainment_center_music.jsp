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
	href="<%=path%>/mycss/entertainment_center_music.css">
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script  type="text/javascript"
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script  type="text/javascript"
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>音乐播放</title>
</head>
<body style="background-color:rgba(105,105,105,0.5);" onload="inita('<%=path %>')">
	<div class="imageall">
		<img src="<%=path%>/myimage/播放音乐背景.jpg" style="width:60%;">
		<div class="progress musictime">
			<div class="progress-bar" role="progressbar" aria-valuenow="60"
				aria-valuemin="0" aria-valuemax="100" style="width:0%;" id="musicbar">
			<span class="sr-only"></span>
			</div>
		</div>
		<div class="allplay">
			<div class="musicplay" onclick="hismusicback()">
				<span class="glyphicon glyphicon-fast-backward musicsound">
				</span>
			</div>
			
			<div class="musicplay">
				<span class="glyphicon glyphicon-step-backward musicsound">
				</span>
			</div>
			<div class="musicplay">
				<span class="glyphicon glyphicon-pause musicsound" id="thismusicpause" onclick="thismusicpause()">
				</span>
				<span class="glyphicon glyphicon-play musicsound" id="thismusicplay" onclick="thismusicplay()" style="display:none;">
				</span>
			</div>
			<div class="musicplay">
				<span class="glyphicon glyphicon-step-forward musicsound">
				</span>
			</div>
			<div class="musicplay" onclick="hismusicfast()">
				<span class="glyphicon glyphicon-fast-forward musicsound"></span>
			
			</div>
		</div>
	</div>
	
	<div class="listmusic">
		<div data-spy="scroll" data-target="#navbar-example" data-offset="0" 
	 style="height:400px;overflow:auto; position: relative;">
			<c:forEach var="music" items="${musics}" varStatus="status">
				<div onclick="lrcchange('<%=path %><c:out value="${music.srctext}"/>')">
					<div onclick="playmusic('<%=path %><c:out value="${music.srcmusic}"/>','<c:out value="${status.index}"/>')">
						<img src="<%=path%>/music/image/<c:out value="${music.srcimage}"/>"
						 class="img-thumbnail" width="140" height="140">
						<p style="font-size:18px;"><c:out value="${music.title}"/></p>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	
	<div>
		<audio id="playmusic" controls style="display:none;">
			<source id="playmusicam" src="" type="audio/mpeg">
			<source id="playmusicao" src="" type="audio/ogg">
			<embed id="playmusicem"  src="">
		</audio>
		<div>
			<div class="lrctext">
				<div id="playtext"  align="center">
					<p id="text1"></p>
					<p id="text2" style="font-size:40px;font-color:rgba(0,0,0,0.6);
					background-color:rgba(255,0,0,0.6);"></p>
					<p id="text3"></p>
					<p id="text4"></p>
					<p id="text5"></p>
					<p id="text6"></p>
				</div>
			</div>
		</div>
	</div>
	
	<div style="position:absolute;width:20%;">
		<div style="height:500px;">
			<div data-spy="scroll" data-target="#navbar-example" data-offset="0" 
	 style="height:100%;overflow:auto; position: relative;" id="addspeak">
	 			
			</div>
		</div>
		<div class="input-group">
            <span class="input-group-addon">输入消息</span>
            <input type="text" class="form-control" id="musicplaytext">
            <span class="input-group-btn">
             	<button class="btn btn-default" type="button" onclick="clicksend()">发送</button>
            </span>
            
        </div>
	</div>
	
	<script type="text/javascript" src="<%=path %>/myjavascript/entertainment_center_music.js">
	</script>
</body>
</html>