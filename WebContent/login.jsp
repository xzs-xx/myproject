<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<link rel="icon" href="./common/images/favicon.ico" type="image/x-icon">
<link rel="stylesheet" type="text/css" href="./mycss/login.css">
<script src="./common/js/jquery-2.1.4/jquery-1.8.0.min.js"></script>
<script src="./common/js/jquery-2.1.4/layer/layer.js"></script>
<script type="text/javascript" src="./myjavascript/login.js"></script>
<title>登录</title>
<!-- 注意开始的首页不能在WEB-INF下面的文件夹中,除非经过特殊处理这是默认的方式，但是不安全不建议采用 -->
<script  type="text/javascript" >
function login(){
	//查看是否取到用户名称
	var tf=$("#username").val();
	$.ajax({
			type:"post",
			url:"login.do",
			data:$("#myForm").serialize(),	
			success:function(result){  					
				//追加默认还原
				$("#username").val("");
				$("#password").val("");
				if(result=="1"){
					window.location="childrenhome.do";
				}else{
					layer.msg(result),setTimeout(
    	    				function(){
    	    					window.location="login.jsp";
    	    				},3000		
    	    			);
				}     
			}			
		}); 
}
//注册跳转
function apply(){
	window.location="apply.jsp";
}
</script>
</head>
<body class="login">
	<div id="content" class="content">
		<form action="login.do" method="post" id="myForm" class="yuyue">
				<p class="login1"><span>登录</span></p>
				<p class="login2"><input class = "username" id="username" type="text" name="username" placeholder="姓名" /></p>
				<p class="login3"><input id="password" type="password" name="password" placeholder="密码" /></p>
				<p class="login4"><button id="u246_input" type="button" value="立刻登录" onclick="login()">立即登录</button></p>
				<p class="login5"><button id="u247_input" type="button" value="立刻注册" onclick="apply()">立刻注册</button></p>
		</form>
	</div>
</body>
</html>