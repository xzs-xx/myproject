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
				<li><a href="#sp" tabindex="-1" data-toggle="tab">歌词</a></li>
			</ul>
		</div>
		<div class="mid_right" style="width: 70%; float: left;">
			<div id="myTabContent" class="tab-content">
				<div class="tab-pane fade in active" id="music">
					<div>
						<audio id="playmusic" controls>
							<source id="playmusic1"
								src="<%=path%>/music/music/杨烁-走在乡间的小路上.mp3" type="audio/mpeg">
							<source id="playmusic2"
								src="<%=path%>/music/music/杨烁-走在乡间的小路上.mp3" type="audio/ogg">
							<embed id="playmusic3"
								src="<%=path%>/music/music/杨烁-走在乡间的小路上.mp3">
						</audio>
						<div>
							播放音乐:<span id="playname"></span>
						</div>
						<c:forEach var="music" items="${musics}">
							<p
								onclick="musicchange('<%=path%><c:out value="${music.srcmusic}"/>','<c:out value="${music.title}"/>')">
								<c:out value="${music.title}" />
							</p>
						</c:forEach>


						<script type="text/javascript">
							function musicchange(src, name) {
								alert(src);
								document.getElementById("playmusic1").src = src;
								document.getElementById("playmusic2").src = src;
								document.getElementById("playmusic3").src = src;
								document.getElementById("playname").innerHTML = name;
								document.getElementById("playmusic").load();
								document.getElementById("playmusic").play();
							}
							function aa() {
								(document.getElementById("playmusic").currentTime);
							}
							function pausemusic() {
								document.getElementById("playmusic").pause();
							}
						</script>
					</div>
				</div>
				<div class="tab-pane fade" id="story">
					<p id="storyput"></p>
					<c:forEach var="story" items="${storys}">
						<p onclick="storychange('<%=path%><c:out value="${story.storytextsrc}"/>')">
							<c:out value="${story.storyname}"/> 
						</p>
					</c:forEach>
					<script>
						function storychange(src){
							alert(src);
							var request=null;
					        if(window.XMLHttpRequest)
					        {
					            request=new XMLHttpRequest();
					        }else if(window.ActiveXObject)
					        {
					            request=new ActiveXObject("Microsoft.XMLHTTP");
					        }
					        if(request)
					        {
					            request.open("GET",src,true);
					            request.onreadystatechange=function()
					            {
					                if(request.readyState===4)
					                {
					                    if (request.status == 200 || request.status == 0)
					                    {
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
				</div>
				<div class="tab-pane fade" id="sp">
					<c:forEach var="video" items="${videos}">
						<p onclick="videochange('<%=path%><c:out value="${video.videosrc}"/>')">
							<c:out value="${video.title}"/> 
						</p>
						<div style="text-align:center"> 
							<button onclick="playPause()">播放/暂停</button> 
							<button onclick="makeBig()">放大</button>
							<button onclick="makeSmall()">缩小</button>
							<button onclick="makeNormal()">普通</button>
							<video id="video1" width="420">
							<source src="<%=path%><c:out value="${video.videosrc}"/>" type="video/mp4">
							<source src="<%=path%><c:out value="${video.videosrc}"/>" type="video/ogg">
							   您的浏览器不支持 HTML5 video 标签。
							</video>
						</div>
						
					</c:forEach>
					<script>
						var myVideo=document.getElementById("video1"); 
						function playPause()
						{ 
							if (myVideo.paused) 
							  myVideo.play(); 
							else 
							  myVideo.pause(); 
						} 
	
							function makeBig()
						{ 
							myVideo.width=560; 
						} 
	
							function makeSmall()
						{ 
							myVideo.width=320; 
						} 
	
							function makeNormal()
						{ 
							myVideo.width=420; 
						} 
						function videochange(){
							
						}
					</script>
				</div>
			</div>
		</div>
	</div>
	<div class="end"></div>
</body>
</html>