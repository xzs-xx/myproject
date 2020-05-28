


function findonebook(id){
	$.ajax({
		type:"post",
		url:"findonebook.do",
		data:{
			"id":id,
		},	
		success:function(result){
			window.location = result;
		}			
	}); 
}