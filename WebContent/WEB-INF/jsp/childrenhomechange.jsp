<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<% String path=request.getContextPath(); %>
<link rel="stylesheet" type="text/css" href="<%=path %>/mycss/childrenhome.css">
<title>首页</title>
<script type="text/javascript" src="<%=path %>/myjavascript/childrenhome.js"></script>

<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body class="bodyall">
	<div class="headstart">
		<div class="headmyself">
			<img src="<%=path %>/myimage/创作.jpg" class="img-circle" width="50px" height="50px">
		</div>
		<div class="headparent">
			<img src="<%=path %>/myimage/创作.jpg" class="img-circle" width="50px" height="50px">
		</div>
	</div>
	<div>
		<div class="midstart">
			<div>
				<div style="position:absolute;top:7%;left:10%;">
					<h1 id = "putchar" style="color:rgba(220,20,60,0.5)"></h1>
				</div>
				<div  style="position:absolute;top:100px;width:80%;left:10%;height:480px;">
					<div class="image1" onclick="personal()"
						onmouseout="mOutimg(this,'image1h3')" onmouseover="mOverimage(this,'image1h3')">
				   		<img src="<%=path %>/myimage/个人主页.jpg" width="100%"style="margin-left:10%;margin-top:10%"/>
				   		<h3 id="image1h3" style="display:none;position:absolute;top:40%;left:35%;">个人主页</h3>
				    </div>
				    <div class="image2" onclick="entertainment()"
				    	 onmouseout="mOutimg(this,'image2h3')" onmouseover="mOverimage(this,'image2h3')">
				   		<img src="<%=path %>/myimage/娱乐中心.jpg" width="100%"style="margin-left:10%;margin-top:10%"/>
				   		<h3 id="image2h3" style="display:none;position:absolute;top:40%;left:35%;">娱乐中心</h3>
				    </div>
				    <div class="image3" onclick="management()"
				    	onmouseout="mOutimg(this,'image3h3')" onmouseover="mOverimage(this,'image3h3')">
				   		<img src="<%=path %>/myimage/管理中心.jpg" width="100%"style="margin-left:10%;margin-top:10%"/>
				   		<h3 id="image3h3" style="display:none;position:absolute;top:40%;left:35%;">管理中心</h3>
				    </div>
				    <div class="image4" onclick="sharing()"
				    	 onmouseout="mOutimg(this,'image4h3')" onmouseover="mOverimage(this,'image4h3')">
				   		<img src="<%=path %>/myimage/分享中心.jpg" width="100%"style="margin-left:10%;margin-top:10%"/>
				   		<h3 id="image4h3" style="display:none;position:absolute;top:40%;left:35%;">分享中心.</h3>
				    </div>
				    <div class="image5" onmouseout="mOutimg(this,'image5h3')" onmouseover="mOverimage(this,'image5h3')">
				   		<img src="<%=path %>/myimage/学习中心.jpg" width="100%"style="margin-left:10%;margin-top:10%"/>
				   		<h3 id="image5h3" style="display:none;position:absolute;top:40%;left:35%;">学习中心</h3>
				    </div>
				    <div class="image6" onmouseout="mOutimg(this,'image6h3')" onmouseover="mOverimage(this,'image6h3')">
				   		<img src="<%=path %>/myimage/创意中心.jpg" width="100%"style="margin-left:10%;margin-top:10%"/>
				   		<h3 id="image6h3" style="display:none;position:absolute;top:40%;left:35%;">创意中心</h3>
				    </div>
				</div>
				<div style="position:absolute;width:200px;height:200px;left:100%;margin-left:-100px;">
				    <svg height="200" width="200" onmouseover="mOverstop()" onmouseout="mOutstart()">
						<path id="pagepersonal"/>
						<path id= "pageentertainment"/>
						<path id= "pagesharing"/>
						<path id= "pagemanagement"/>
						<path id= "pagestudy"/>
						<path id= "pagecreative"/>
					</svg>
				</div>
			</div>
		</div>
	</div>
</body>
</html>