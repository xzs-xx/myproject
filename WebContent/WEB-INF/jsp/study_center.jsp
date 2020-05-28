<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<% String path=request.getContextPath(); %>
<link rel="stylesheet" type="text/css" href="<%=path %>/mycss/childrenhome.css">
<title>Insert title here</title>


<link rel="stylesheet"
	href="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="http://cdn.static.runoob.com/libs/jquery/2.1.1/jquery.min.js"></script>
<script
	src="http://cdn.static.runoob.com/libs/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div>
	<div style="height:100px;width:100%;background:red;">
	</div>
	<ul id="myTab" class="nav nav-tabs">
		<li class="active" style="width:200px;text-align:center;">
			<a href="#yuwen" data-toggle="tab">
				语文
			</a>
		</li>
		<li  style="width:200px;text-align:center;"><a href="#shuxue" data-toggle="tab">数学</a></li>
		<li  style="width:200px;text-align:center;"><a href="#yingyu" data-toggle="tab">英语</a></li>
	</ul>
	<div id="myTabContent" class="tab-content">
	
	
		<div class="tab-pane fade in active" id="yuwen">
			<div class="row" style="width:95%;">
				<c:forEach var="book" items="${books}" varStatus="userStatus">
					<c:if test="${book.booktype =='苏教版语文课本'}">
						<div onclick="findonebook('<c:out value='${book.id}'/>')">
							<div class="col-sm-6 col-md-3">
								<div class="thumbnail">
								    <img width="150px"src="<%=path %>/<c:out value='${book.booksrc}'/>/1.jpg" alt="通用的占位符缩略图">
								</div>
								<p align="center">
									<c:out value="${book.bookname}"/>
								<p>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
		
		<div class="tab-pane fade" id="shuxue">
			<div class="row" style="width:95%;">
				<c:forEach var="book" items="${books}" varStatus="userStatus">
					<c:if test="${book.booktype =='苏教版数学课本'}">
						<div>
							<div class="col-sm-6 col-md-3">
								<div class="thumbnail">
								    <img width="150px"src="<%=path %>/<c:out value='${book.booksrc}'/>/1.jpg" alt="通用的占位符缩略图">
								</div>
								<p align="center"> 
									<c:out value="${book.bookname}"/>
								<p>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
		
		<div class="tab-pane fade" id="yingyu">
			<div class="row" style="width:95%;">
				<c:forEach var="book" items="${books}" varStatus="userStatus">
					<c:if test="${book.booktype =='苏教版英语课本'}">
						<div>
							<div class="col-sm-6 col-md-3">
								<div class="thumbnail">
								    <img width="150px"src="<%=path %>/<c:out value='${book.booksrc}'/>/1.jpg" alt="通用的占位符缩略图">
								</div>
								<p align="center">
									<c:out value="${book.bookname}"/>
								<p>
							</div>
						</div>
					</c:if>
				</c:forEach>
			</div>
		</div>
	</div>
	
	
	
	
	
</div>
</body>
<script type="text/javascript" src="<%=path %>/myjavascript/study_center.js"></script>
</html>