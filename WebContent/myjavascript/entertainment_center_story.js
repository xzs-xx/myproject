var storystr;
var storyindex = -1;
var storylrc;

function readstory(storysrc,title){
	storyindex = -1;
	storychange(storysrc);
	document.getElementById("storyput").innerHTML = "欢迎来阅读:"+title;
}

function next(){
	if(storyindex < storystr.length - 1){
		storyindex = storyindex + 1;
		document.getElementById("storyput").innerHTML = storystr[storyindex];
	}
}

function pos(){
	
	if(storyindex > 0){
		storyindex = storyindex - 1;
		document.getElementById("storyput").innerHTML = storystr[storyindex];
	}
}

function speakstory(){
	var stra = "请点击下一页";
	if(storyindex >= 0)stra = storystr[storyindex];
	$.ajax({
		type:"post",
		url:"entertainment_center_story.do",
		data:{
			"storytext":stra
		},
		success:function(result){ 
		}
	}); 
}

function storychange(src){
	var request=null;
	if(window.XMLHttpRequest){
		request=new XMLHttpRequest();
	}else if(window.ActiveXObject){
		request=new ActiveXObject("Microsoft.XMLHTTP");
	}
	if(request){
		request.open("GET",src,true);
		request.onreadystatechange=function(){
		if(request.readyState===4){
			if (request.status == 200 || request.status == 0){
				var str=request.responseText;
				storystr = str.split("\n");
			}
		}
	}
	request.send(null);
	}else{
		alert("error");
	}
}