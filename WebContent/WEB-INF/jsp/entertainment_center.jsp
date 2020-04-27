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
<body>
	<div class="head1"></div>
	<p>
		<a href="childrenhome.do">首页></a>娱乐中心>
	</p>
	<div class="mid">
		<div class="mid_left" style="width: 30%; float: left;">
			<ul class="nav nav-pills nav-stacked">
				<li class="active"><a href="#music" data-toggle="tab">音乐</a></li>
				<li><a href="#story" tabindex="-1" data-toggle="tab">故事</a></li>
				<li><a href="#sp" tabindex="-1" data-toggle="tab">视频</a></li>
			</ul>
		</div>
		<div class="mid_right" style="width: 70%; float: left;">
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade in active" id="music">
					<div>
						<c:forEach var="music" items="${musics}">
							<a
								onclick="musicchange('<c:out value="${music.srcmusic}"/>','<c:out value="${music.title}"/>','<c:out value="${music.srctext}"/>')">
								<c:out value="${music.title}" />
							</a>
						</c:forEach>
						<script type="text/javascript">
							function musicchange(src, name, lrc) {
								$.ajax({
									type:"post",
									url:"entertainment_center_music.do",
									data:{
										"musicsrc":src,
										"musicname":name,
										"musiclrc":lrc
									},	
									success:function(result){  					
										alert(result);
										window.location=result;
									}		
								});
							}
						</script>
					</div>
				</div>
				<div class="tab-pane fade" id="story">
					<c:forEach var="story" items="${storys}">
						<p onclick="storychange('<c:out value="${story.storytextsrc}"/>','<c:out value="${story.storyname}"/>')">
							<c:out value="${story.storyname}"/> 
						</p>
					</c:forEach>
					<script>
						function storychange(src,storyname){
							$.ajax({
								type:"post",
								url:"entertainment_center_story.do",
								data:{
									"storysrc":src,
									"storyname":storyname,
								},	
								success:function(result){  					
									alert(src);
									window.location=result;
								}		
							});
						}
					</script>
				</div>
				<div class="tab-pane fade" id="sp">
					<c:forEach var="video" items="${videos}">
						<p onclick="videochange('<c:out value="${video.videosrc}"/>','<c:out value="${video.title}"/>')">
							<c:out value="${video.title}"/> 
						</p>
					</c:forEach>
					<script >
						function videochange(videosrc,videotitle){
							$.ajax({
								type:"post",
								url:"entertainment_center_video.do",
								data:{
									"videosrc":videosrc,
									"videotitle":videotitle,
								},	
								success:function(result){  					
									alert(result);
									window.location=result;
								}		
							});
						}
					</script>
				</div>
			</div>
		</div>
	</div>
	<div class="end"></div>
</body>
</html>