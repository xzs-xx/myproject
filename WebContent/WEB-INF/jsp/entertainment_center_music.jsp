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
<body onload="musicchange('<%=path%><c:out value="${sessionScope.musiclrc}"/>')">
	<div class="head1"></div>
	<p>
		<a href="childrenhome.do">首页></a><a href="entertainment_center.do">娱乐中心></a>播放音乐
	</p>
	
	<div class="panel panel-default">
		<div class="panel-heading">
			<h3 class="panel-title">
				播放音乐:<c:out value="${sessionScope.musicname}"/>
			</h3>
		</div>
		<div class="panel-body">
			<audio id="playmusic" controls>
				<source id="playmusic1" src="<%=path%><c:out value="${sessionScope.musicsrc}"/>" type="audio/mpeg">
				<source id="playmusic2" src="<%=path%><c:out value="${sessionScope.musicsrc}"/>" type="audio/ogg">
				<embed id="playmusic3"  src="<%=path%><c:out value="${sessionScope.musicsrc}"/>">
			</audio>
			<p id="text1">1</p>
			<p id="text2">2</p>
			<p id="text3">3</p>
		</div>
	</div>	
	
	
	<script  type="text/javascript">
	var musicArray = new Array();
	function musicchange(lrc) {
		document.getElementById("playmusic").play();
		var request=null;
		if(window.XMLHttpRequest){
			request=new XMLHttpRequest();
		}else if(window.ActiveXObject){
			request=new ActiveXObject("Microsoft.XMLHTTP");
		}
		if(request){
			request.open("GET",lrc,true);
			request.onreadystatechange=function(){
				if(request.readyState===4){
					if (request.status == 200 || request.status == 0){
						var str=request.responseText;
						var strs = str.split("\n");
						$.each(strs, function (i, item) {
							var t = item.substring(item.indexOf("[") + 1, item.indexOf("]"));
							musicArray.push({
						      t: (t.split(":")[0] * 60 + parseFloat(t.split(":")[1])).toFixed(3),
						      c: item.substring(item.indexOf("]") + 1, item.length)
						    });
						});
					}
				}
			}
			request.send(null);
		}else{
			alert("error");
		}
	}
	document.getElementById("playmusic").ontimeupdate = function () {
		var currenttime=document.getElementById("playmusic").currentTime;
		var timeindex = 0;
		for(i = 0;i < musicArray.length;i++){
			var time = parseFloat(musicArray[i].t);
			if(time > currenttime){
				timeindex = i;
				break;
			}
		}
		if(timeindex > 0){
			document.getElementById("text1").innerHTML=musicArray[timeindex - 1].c;
		}
		document.getElementById("text2").innerHTML=musicArray[timeindex].c;
		if(timeindex < musicArray.length - 1){
		document.getElementById("text3").innerHTML='<p>' + musicArray[timeindex + 1].c + '</p>';
		}
	}
	function aa() {
		(document.getElementById("playmusic").currentTime);
	}
	function pausemusic() {
		document.getElementById("playmusic").pause();
	}
	</script>
</body>
</html>