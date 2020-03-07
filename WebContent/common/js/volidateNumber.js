var code;
$(function() {
 	var container1 = document.getElementById("code");
    code = new vCode(container1,{fontSizeMin:20,fontSizeMax:25,colors:["#000000"],lines:3});
    $("#valadate").click(function(){
    	valadate();
    });
});
function valadate() {
	if ($("#loginName").val() == "") {
		$("#message").text('请输入用户名');
		return false;
	}
	if ($("#password").val() == "") {
		$("#message").text('请输入密码');
		return false;
	}
//	var regex=new RegExp("^[0-9a-zA-Z]{8,16}$");
//	if(!regex.test($("#password").val())){
//		$("#message").text('密码格式不正确!');
//		return false;
//	}
	if (validates()) {
		$('#inform').submit();
	}
}
function validates() {
	var oValue = $('#textfield3').val().toLowerCase();
	if (oValue == 0) {
		$("#message").text('请输入验证码');
		$('#textfield3').val("");
		$('#textfield3').focus();
		return false;
	} else if (!code.verify(oValue)) {
		$("#message").text('验证码不正确，请重新输入');
		$("#code").click();
		$('#textfield3').val("");
		$('#textfield3').focus();
		return false;
	} else {
		return true;
	}
}
