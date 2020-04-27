function login(){
	//查看是否取到用户名称
	var tf=$("#username").val();
	$.ajax({
			type:"post",
			url:"login.do",
			data:{
				"username":$("#username").val(),
				"password":$("#password").val()
			},
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

function apply(){
	window.location="apply.jsp";
}