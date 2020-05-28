<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<% String path=request.getContextPath(); %>
<link rel="stylesheet" href="<%=path%>/mycss/study_center_book.css">
<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script  type="text/javascript"
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script  type="text/javascript"
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>学习页面</title>
</head>
<body style="background-image: url(;
	background-color:rgb(0,250,154);
	background-size:100% auto;
	background-repeat: no-repeat;">
	<img src="<%=path %>/myimage/阅读课本.jpg"  width="100%" height="650px" style="position:absolute;">
	<div class="qiqiu1" id="shownotes">
		<img src="<%=path %>/myimage/气球2.png" id="changeimg"
			width="100%" height="100%" style="position:absolute;">
		<div class="qiqiu2">
			<p id="shownotestext"></p>
		</div>
	</div>
	<div style="width:600px;height:460px;background-color:rgba(221,160,221,0.4);position:absolute;left:30%;top:20%;">
		<div style="width:300px;float:left;">
			<img src="<%=path %><c:out value='${book.booksrc}'/>/1.jpg"
				id = "putbookimg" class="img-thumbnail" width="300px" height="400px">
			<div class="input-group" style="background-color:rgba(221,160,221,0.4);">
			 	<span class="glyphicon glyphicon-circle-arrow-left" style="font-size: 37px;float:left;"
			 		onclick="posnext(-1)"> </span>
	            <span class="input-group-addon">笔记</span>
	            <input type="text" class="form-control" id="notestext">
	            <span class="input-group-addon" onclick="savenotes()">保存</span>
	            <span class="glyphicon glyphicon-circle-arrow-right" style="font-size: 37px;float:right;"
	            	onclick="posnext(1)"></span>
        	</div>
		</div>
		<div style="float:left;width:300px;height:460px;">
			<div data-spy="scroll" data-target="#navbar-example" data-offset="0"
     			style="height:460px;overflow:auto; position: relative;">
				<div style="width:300px;height:422px;">
					<h3 align="center">笔记显示</h3>
					<div id="putnotetext">
						
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script type="text/javascript" src="<%=path %>/myjavascript/study_center_book.js"></script>
<script type="text/javascript">
	putbook('<c:out value="${book.id}"/>','<c:out value="${book.bookname}"/>',
			'<c:out value="${book.booksrc}"/>','<c:out value="${book.bookpage}"/>','<c:out value="${book.booktype}"/>',
			'<%=path %>');
	init();
</script>
</html>