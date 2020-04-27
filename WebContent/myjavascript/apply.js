var pos = 1;
function childrento(){
	pos = 1;
}
function admin(){
	pos = 2;
}
function parents(){
	pos = 3;
}
function apply() {
	//alert($("#password").val());
	$.ajax({
		type : "post",
		url : "apply.do",
		data : {
			"username" : $("#username").val(),
			"password" : $("#password").val(),
			"email"    : $("#email").val(),
			"tel"      : $("#tel").val(),
			"portrait" : null,
			"pos"      : pos
		},
		dataType:"text",
		success:function(result) {
			//追加默认还原
			$("#username").val("");
			$("#password").val("");
			if (result == "1") {
				layer.msg("注册成功"), setTimeout(function() {
					window.location = "login.jsp";
				}, 3000);
			} else {
				layer.msg(result), setTimeout(function() {
					window.location = "apply.jsp";
				}, 3000);
			}
		},
		error:function(error){
			alert(error);
		}
	});
}