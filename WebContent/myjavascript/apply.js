var pos = 1;
function childrenchange(){
	document.getElementById("children").style.background = "rgba(255,255,255,0.5)";
	document.getElementById("momandfad").style.background = "rgba(255,255,255,1)";
	pos = 1;
}
function adminchange(){
	document.getElementById("momandfad").style.background = "rgba(255,255,255,0.5)";
	document.getElementById("children").style.background = "rgba(255,255,255,1)";
	pos = 2;
}
function apply(){
	var tf=$("#username").val();
	$.ajax({
		type:"post",
		url:"apply.do",
		data:{
			"username":$("#username").val(),
			"password":$("#password").val(),
			"email":$("#email").val(),
			"tel":$("#tel").val(),
			"portrait":null,
			"pos":pos
		},
		success:function(result){ 
			if(result == 1)alert("注册成功");
			window.location="login.jsp";
		}
	}); 
}