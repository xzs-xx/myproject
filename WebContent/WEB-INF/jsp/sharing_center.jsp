<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
				<div style="padding: 10px 100px 10px;">
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
				<div style="padding: 10px 100px 10px;">
					<form class="bs-example bs-example-form" role="form">
						<div class="input-group">
							<span class="input-group-addon">题目</span>
							<input type="text" class="form-control" placeholder="twitterhandle">
						</div>
						<br>
						<textarea style="width:100%;padding:0px 0px 0px 0px;height:200px;resize:none;" placeholder="twitterhandle"></textarea>
						<button type="button" class="btn btn-primary">保存日记</button>
					</form>
				</div>
			</div>
			<div class="tab-pane fade" id="putimage">
				<div style="padding: 10px 100px 10px;">
					<form class="bs-example bs-example-form" role="form">
						<div class="input-group">
							<span class="input-group-addon">简要描述图片</span>
							<input type="text" class="form-control" placeholder="twitterhandle">
						</div>
						<div class="form-group">
							<label for="inputfile">选择图片</label>
						    <input type="file" id="inputfile">
						    <p class="help-block">这里是块级帮助文本的实例。</p>
						    <div>wre</div>
 						</div>
					</form>
				</div>
			</div>
			<div class="tab-pane fade" id="seeing">
				111111
			</div>
		</div>
		
	</div>
</body>
</html>