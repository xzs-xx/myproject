<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<% String path = request.getContextPath();%>
<link rel="stylesheet" type="text/css"
	href="<%=path%>/mycss/creative_center.css">
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
	<a href="childrenhome.do">首页></a>创意中心>
	<div class="mind">
		<div class="mind_left">
			<div style="border-bottom:2px dashed #F00;height:25px;">
				<input type="file" id="fileout" value="导入图片">
			</div>
			<div style="border-bottom:2px dashed #F00;height:25px;">存储创作</div>
			<div style="border-bottom:2px dashed #F00;height:25px;">
				<div style="float:left;">颜色选择</div>
				<div style="float:left;width:50px;height:20px;background-color:red;"></div>
			</div>
			<div style="height:20px;width:100%;background:red;"></div>
		</div>
		<div class="mind_right">
			<canvas id="imageput" width="300px" height="300px"> <!--宽高写在html里，写在css里有问题-->
    		</canvas>
    		<script>
				var fileInput = document.getElementById("fileout");
				fileInput.addEventListener('change', function () {
					var file = this.files[0];
					var reader = new FileReader();
					reader.readAsDataURL(file);
					reader.onloadend=function(){
						var img = new Image();
						img.src = reader.result;  
						img.height="400";
						img.width="400";
						img.onload=function(){
							var oC = document.getElementById('imageput');
							var oCG = oC.getContext('2d');

							oCG.beginPath();
							oCG.width=oCG.width;
							oCG.closePath();
							oCG.fill();
							oCG.drawImage(img, 0, 0);
						}
					}
					
				});
			</script>
    		<script>
					window.onload= function() {
						var oC = document.getElementById('imageput');
						var oCG = oC.getContext('2d');
						oC.onmousedown = function(ev) {
							var ev = ev || window.event;
							oCG .strokeStyle="red";
							oCG.moveTo(ev.clientX-oC.offsetLeft,ev.clientY-oC.offsetTop);
						 	//ev.clientX-oC.offsetLeft,ev.clientY-oC.offsetTop鼠标在当前画布上X,Y坐标
							document.onmousemove= function(ev) {
								var ev = ev || window.event;//获取event对象
								oCG.lineTo(ev.clientX-oC.offsetLeft,ev.clientY-oC.offsetTop);
								oCG.stroke();
								 };
								oC.onmouseup= function() {
								document.onmousemove = null;
								document.onmouseup = null;
								};
							};						
						};
			</script>
		</div>
	</div>
</body>
</html>