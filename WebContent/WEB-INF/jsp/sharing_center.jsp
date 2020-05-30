<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="multipart/form-data; charset=utf-8" />
<% String path=request.getContextPath(); %>
<link rel="stylesheet" type="text/css"
	href="<%=path%>/mycss/sharing_center.css">
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>分享中心</title>
</head>
<body>
	<div style="position:absolute;width:80%;">
		<p style="text-shadow: 5px 5px 5px #a8a8a8;font-size:30px;">
			今天是<span id="timeshow"></span>，你可以记下你今天的成就
		</p>
		<div style="width:100%;" id="diaryshowpage">
			<div class="diarybody" id="diarybody">
				<header style="background-color: #a8a8a8;">
					<div class="input-group" style="width:40%;margin-left:20%;">
						<span class="input-group-addon">题目</span>
						<input type="text" class="form-control" placeholder="输入题目" id="diarytitle" 
							style="background-color:#a8a8a8;">
						<span class="input-group-addon" onclick="diaryonclick()">保存日记</span>
					</div>
				</header>
				<p contenteditable="true" class="diarymain" id="diarymain"></p>
			</div>
		</div>
		
		
		
		<div style="width:100%;display:none;"  id="compositionshowpage">
			<div class="diarybody" id="diarybody" style="font-size: 1.5rem;">
				<header style="background-color: #a8a8a8;">
					<div class="input-group" style="width:40%;margin-left:20%;">
						<span class="input-group-addon">题目</span>
						<input type="text" class="form-control" placeholder="输入作文" id="compositiontitle" 
							style="background-color:#a8a8a8;">
						<span class="input-group-addon" onclick="compositiononclick()">保存作文</span>
					</div>
				</header>
				<p contenteditable="true" class="diarymain" id="compositionmain"
				style="background-color: #000000;"></p>
				
			</div>
		</div>
		
		
		
		<div style="width:100%;display:none;"  id="thinkshowpage">
			<form id="imgform" class="bs-example bs-example-form" role="form" action="img.do" method="post" enctype="multipart/form-data">
				<div class="input-group">
					<span class="input-group-addon">描述你的瞬间</span>
					<input type="text" class="form-control" placeholder="twitterhandle" id="imgtitle" name="imgtitle" class="imgtitle">
				</div>
				<div class="form-group">
					<label for="inputfile">选择图片</label>
					<input type="file" id="file" name="file" class="file">
					<img src="" height="300px" alt="Image preview area..." title="preview-img" id="imgout">
 				</div>
 				<input class="btn btn-primary" type="submit" value="保存图片">
			</form>
		</div>
		
		
		
		<div style="width:100%;display:none;"  id="shapingshowpage">
			<h1 align="center" style="background-color:blue;">分享精彩的世界</h1>
			<div style="height:100px;width:100%;background-color:blue;margin-top:-10px;">
				<h1 style="float:left">看精彩的世界</h1>
				<div onmouseover="onsharing()" onmouseout="outsharing()">
					<div style="width:80px;float:left" id = "sharingdiary"
						onclick="onclicksharing('sharingdiary','diary')">
						<img src="<%=path %>/myimage/日记.jpg"  class="img-circle" height="80px">
					</div>
					<div style="width:80px;display:none;float:left" id = "sharingcomposition"
						onclick="onclicksharing('sharingcomposition','composition')">
						<img src="<%=path %>/myimage/作文.jpg"  class="img-circle" height="80px">
					</div>
					<div style="width:80px;display:none;float:left" id = "sharingimage"
						 onclick="onclicksharing('sharingimage','image')">
						<img src="<%=path %>/myimage/日常.jpg" class="img-circle" height="80px">
					</div>
				</div>
			</div>
			
			
			<div>
				<div style="font-size:30px;">
					<div style="width:70%;float:left;">
					
						<p data-toggle="modal" data-target="#myModal" onclick="changebodyuserp()"
						>作者><span style="color:blue;" id="diaryuser">没有，选择下一页</span></p>
						
						<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
											&times;
										</button>
										<h4 class="modal-title" id="myModalLabel">
											关注
										</h4>
									</div>
									<div class="modal-body">
										<div id="bodyuserp">
										</div>
									</div>
									<div class="modal-footer">
										<button type="button" class="btn btn-default" data-dismiss="modal">关闭
										</button>
										<button type="button" class="btn btn-primary" onclick="addfans()">
											确认关注
										</button>
									</div>
								</div><!-- /.modal-content -->
							</div><!-- /.modal -->
						</div>
						
						
						
						
						
						
						
						
						<div style="width:100%;">
							<p>
								<span onclick="ondiary(-1)">上一页</span>
								<span  onclick="ondiary(1)">下一页</span>
								<span  onclick="collection()">收藏</span>
							</p>
						</div>
						<div id="sharingtext">
							<p align="center"  style="font-size:15px;">
								标题:<span id="diarytitle2">大家好</span>
							</p>
							<div align="center"  style="font-size:20px;">
								<div  id="diarytext">刚进来，选择下一页选择阅读</div>
							</div>
						</div>
					</div>
					<div style="width:30%;float:left;">
						<div class="input-group" style="width:100%;">
							<span class="input-group-addon">输入评论</span>
							<input type="text" class="form-control" placeholder="输入。。。" id="commentdiary" 
								style="background-color:#a8a8a8;">
							<span class="input-group-addon" onclick="commentdiary('<c:out value="${sessionScope.username}"/>')">发表</span>
						</div>
						<div data-spy="scroll" data-target="#navbar-example" data-offset="0"
    				 		style="height:300px;overflow:auto; position: relative;">
							<div id="adddiarycomment">
								
							</div>
						</div>
					</div>
				</div>
				
				
				
				
			</div>
			
			
			
			
		</div>
		
	</div>
	
	
	
	
	<div style="position:absolute;width:20%;left:80%;background:#a8a8a8;min-height: 100vh;">
		<div style="width:50%;float:right;" onmouseover="mOverimg()" onmouseout="mOutimg()">
			<img src="<%=path %>/myimage/日记.jpg"  class="img-circle" width="100%"
				id="diary_img" onclick="changepage('diary_img','diaryshowpage')">
			<img src="<%=path %>/myimage/作文.jpg"  class="img-circle" width="100%"
				id="composition_img"	style="display:none;"
				onclick="changepage('composition_img','compositionshowpage')">
			<img src="<%=path %>/myimage/日常.jpg" class="img-circle" width="100%"
				id="think_img"	style="display:none;"
				 onclick="changepage('think_img','thinkshowpage')">
			<img src="<%=path %>/myimage/创作.jpg"  class="img-circle" width="100%"
				id="shaping_img"	style="display:none;"
				 onclick="changepage('shaping_img','shapingshowpage')">
		</div>
	</div>
	<script type="text/javascript" src="<%=path %>/myjavascript/sharing_center.js"></script>
	<c:forEach var="sharingdiary" items="${sharingdiarys}" varStatus="status">
		<script type="text/javascript">
			addsharingdiary('<c:out value="${sharingdiary.id}"/>',
			'<c:out value="${sharingdiary.username}"/>','<c:out value="${sharingdiary.title}"/>',
			'<c:out value="${sharingdiary.text}"/>','<c:out value="${sharingdiary.time}"/>');
		</script>
	</c:forEach>
	<c:forEach var="composition" items="${compositions}" varStatus="status">
		<script type="text/javascript">
			addsharingcomposition('<c:out value="${composition.id}"/>',
			'<c:out value="${composition.username}"/>','<c:out value="${composition.title}"/>',
			'<c:out value="${composition.src}"/>','<c:out value="${composition.time}"/>');
		</script>
	</c:forEach>
	<c:forEach var="shareimage" items="${shareimages}" varStatus="status">
		<script type="text/javascript">
			addshareimage('<c:out value="${shareimage.id}"/>',
			'<c:out value="${shareimage.username}"/>','<c:out value="${shareimage.title}"/>',
			'<c:out value="${shareimage.src}"/>','<c:out value="${shareimage.time}"/>');
		</script>
	</c:forEach>
	<script type="text/javascript">
		initpath("<%=path%>");
	</script>
</body>
</html>