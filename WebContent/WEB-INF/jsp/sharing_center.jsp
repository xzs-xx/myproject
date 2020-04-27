<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
<title>Insert title here</title>
</head>
<body>
	<div class="head1"></div>
	<p><a href="childrenhome.do">首页></a>分享页面></p>
	<div class="mind">
		<ul id="myTab" class="nav nav-tabs">
			<li class="active"><a href="#home" data-toggle="tab"> 编写日记 </a></li>
			<li><a href="#ios" data-toggle="tab">编写作文</a></li>
			<li><a href="#putimage" data-toggle="tab">上传图片</a></li>
			<li><a href="#seeing" data-toggle="tab">查看分享资源</a></li>
		</ul>
		<div id="myTabContent" class="tab-content">
			<div class="tab-pane fade in active" id="home">
				<div style="padding: 10px 200px 10px;">
					<form class="bs-example bs-example-form" role="form" action="adddiary.do" method="post">
						<div class="input-group">
							<span class="input-group-addon">题目</span>
							<input type="text" class="form-control" placeholder="twitterhandle" id="diarytitle">
						</div>
						<br>
						<textarea id="diarytext" style="width:100%;padding:0px 0px 0px 0px;height:100px;resize:none;" placeholder="twitterhandle"></textarea>
						<button type="button" class="btn btn-primary" onclick="diaryonclick()">保存日记</button>
					</form>
					<script type="text/javascript">
						function diaryonclick(){
							var title = $("#diarytitle").val();
							var text = $("#diarytext").val();
							$.ajax({
								type:"post",
								url:"adddiary.do",
								data:{
									"title":title,
									"text":text
								},	
								success:function(result){  					
									alert(result);
								}			
							}); 
						}
					</script>
				</div>
			</div>
			<div class="tab-pane fade" id="ios">
				<div style="padding: 10px 200px 10px;">
					<form class="bs-example bs-example-form" role="form" action="composition.do" method="post">
						<div class="input-group">
							<span class="input-group-addon">题目</span>
							<input type="text" class="form-control" placeholder="twitterhandle" id="compositiontitle">
						</div>
						<br>
						<textarea id="compositiontext" style="width:100%;padding:0px 0px 0px 0px;height:200px;resize:none;" placeholder="twitterhandle"></textarea>
						<button type="button" class="btn btn-primary" onclick="compositiononclick()">保存作文</button>
					</form>
					<script type="text/javascript">
						function compositiononclick(){
							var title = $("#compositiontitle").val();
							var text = $("#compositiontext").val();
							$.ajax({
								type:"post",
								url:"composition.do",
								data:{
									"title":title,
									"text":text
								},	
								success:function(result){  					
									alert(result);
								}			
							}); 
						}
					</script>
				</div>
			</div>
			<div class="tab-pane fade" id="putimage">
				<div style="padding: 10px 200px 10px;">
					<form id="imgform" class="bs-example bs-example-form" role="form" action="img.do" method="post" enctype="multipart/form-data">
						<div class="input-group">
							<span class="input-group-addon">简要描述图片</span>
							<input type="text" class="form-control" placeholder="twitterhandle" id="imgtitle" name="imgtitle" class="imgtitle">
						</div>
						<div class="form-group">
							<label for="inputfile">选择图片</label>
						    <input type="file" id="file" name="file" class="file">
						    <img src="" height="200" alt="Image preview area..." title="preview-img" id="imgout">
 						</div>
 						<input class="btn btn-primary" type="submit" value="保存图片">
					</form>
					<script type="text/javascript">
						var fileInput = document.getElementById("file");
						var previewImg = document.getElementById('imgout');
						fileInput.addEventListener('change', function () {
						var file = this.files[0];
						var reader = new FileReader();
						// 监听reader对象的的onload事件，当图片加载完成时，把base64编码賦值给预览图片
						reader.addEventListener("load", function () {
						      previewImg.src = reader.result;
						      }, false);
						      // 调用reader.readAsDataURL()方法，把图片转成base64
						      reader.readAsDataURL(file);
						      //alert(fileout.value);
						  }, false);
						
					</script>
				</div>
			</div>
			<div class="tab-pane fade" id="seeing">
				<ul class="nav nav-pills nav-stacked" style="width:20%;float:left;">
					<li class="active">
						<a href="#Diary" data-toggle="tab">
							<img src="<%=path%>/myimage/日记.jpg" height="20" width="20">
							日记
						</a>
					</li>
					<li>
						<a href="#Composition" data-toggle="tab">
							<img src="<%=path%>/myimage/作文.jpg" height="20" width="20">
							作文
						</a>
					</li>
					<li>
						<a href="#ShareImage" data-toggle="tab">
						<img src="<%=path%>/myimage/日常.jpg" height="20" width="20">
						日常
						</a>
					</li>
					<li>
						<a href="#Creative" data-toggle="tab">
						<img src="<%=path%>/myimage/创作.jpg" height="20" width="20">
						创作
						</a>
					</li>
				</ul>
				<div class="tab-content" style="float:left;width:70%;">
					<div class="tab-pane fade in active" id="Diary">
						<div>
							<a href="#" class="btn btn-info btn-lg"  onclick="nextonclick()">
								<span class="glyphicon glyphicon-arrow-left"></span> 上一个
							</a>
							<a href="#" class="btn btn-info btn-lg" style="float:right;" onclick="posonclick()">
								<span class="glyphicon glyphicon-arrow-right"></span> 下一个
							</a>
						</div>
						<p id="posDiary" align="center">首页，请点击下一个</p>
						<div class="input-group">
				            <span class="input-group-addon">输入</span>
				            <input type="text" class="form-control" id="commentdiary">
				            <span class="input-group-addon">
				            	<a onclick="commentdiary()">评论</a>
				            	<a onclick="collectiondiary()">收藏</a>
				            </span>
				        </div>
				        
				        <!-- 模拟框  -->
				        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
							<div class="modal-dialog">
								<div class="modal-content">
									<div class="modal-header">
										<button type="button" class="close" data-dismiss="modal" aria-hidden="true">
											&times;
										</button>
										<h4 class="modal-title" id="myModalLabel" align="center">
											关注
										</h4>
									</div>
									<div class="modal-body" id="fansuser">
										
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
				        
						<script type="text/javascript">
							var sharediary_index=-1;
							var diaryid = null;
							var fansuser = null;
							function posonclick(){
								$.ajax({
									type:"post",
									url:"sharing_diarysee.do",
									data:{
										"sharediary_index":sharediary_index+1
									},	
									success:function(result){
										if(result[0]=="存在下一个"){
											document.getElementById("posDiary").innerHTML=
												'<button data-toggle="modal" data-target="#myModal" class="btn btn-primary btn-lg">姓名:'+result[3]+'</button>'+
												'<h3 align="center">题目'+result[1]+'</h3>'+
												'<p align="center">'+result[2]+'</p>';
												sharediary_index = sharediary_index+1;
												diaryid = result[4];
												fansuser = result[3];
												document.getElementById("fansuser").innerHTML =  "关注" + result[3];
										}else{
											
										}
									}			
								}); 
							}
							
							function nextonclick(){
								$.ajax({
									type:"post",
									url:"sharing_diarysee.do",
									data:{
										"sharediary_index":sharediary_index-1
									},	
									success:function(result){
										if(result[0]=="存在下一个"){
											document.getElementById("posDiary").innerHTML=
												'<p data-toggle="modal" data-target="#myModal">姓名:'+result[3]+'</p>'+
												'<h3 align="center">题目'+result[1]+'</h3>'+
												'<p align="center">'+result[2]+'</p>';
												sharediary_index = sharediary_index-1;
												diaryid = result[4];
												fansuser = result[3];
												document.getElementById("fansuser").innerHTML = "关注"+result[3];
										}else{
											
										}
									}			
								}); 
							}
							
							function commentdiary(){
								var commentdiary = $("#commentdiary").val();
								$.ajax({
									type:"post",
									url:"commentdiary.do",
									data:{
										"sharediary_index":sharediary_index,
										"commentdiary":commentdiary
									},	
									success:function(result){
										alert(result);
									}			
								}); 
							}
							function collectiondiary(){
								$.ajax({
									type:"post",
									url:"collection.do",
									data:{
										"collectionid":diaryid,
										"collectiontype":"diary"
									},	
									success:function(result){
										alert(result);
									}			
								}); 
							}
							function addfans(){
								$.ajax({
									type:"post",
									url:"fansuser.do",
									data:{
										"username":fansuser
									},	
									success:function(result){
										alert(result);
									}			
								}); 
							}
						</script>
					</div>
					<div class="tab-pane fade" id="Composition">
						作文
					</div>
					<div class="tab-pane fade" id="ShareImage">
						日常
					</div>
					<div class="tab-pane fade" id="Creative">
						创作
					</div>
				</div>
			</div>
		</div>
		
	</div>
</body>
</html>