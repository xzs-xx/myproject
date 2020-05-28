var diarylist = null;
var compositionlist = null;
var shareimagelist = null;
var path=null;
var managetype = null;
var statuidex = null;
var statuid = null;
function init(){
	$.ajax({
		type:"post",
		url:"management_diary.do",
		data:{
		},	
		success:function(result){
			diarylist = result;
		}		
	});
	$.ajax({
		type:"post",
		url:"management_composition.do",
		data:{
		},	
		success:function(result){
			compositionlist = result;
		}		
	});
	$.ajax({
		type:"post",
		url:"management_shareimage.do",
		data:{
		},	
		success:function(result){
			shareimagelist = result;
		}		
	});
}
init();

function getcomment(){
	$.ajax({
		type:"post",
		url:"allcomment.do",
		data:{
			"id":statuid
		},	
		success:function(result){
			var i;
			document.getElementById('adddiarycomment').innerHTML = "";
			for(i = 0;i<result.length;i++){
				document.getElementById('adddiarycomment').innerHTML += "<p>" + result[i].commentuser + ":"
				+ result[i].commenttext + "</p>";
			}
		}
	}); 
}

function setpath(src){
	path = src;
}

function putshare(booleannum){
	if(booleannum == 1)document.getElementById("shareboolean").style.color="red";
	else document.getElementById("shareboolean").style.color="black";
}

function puttop(){
	if(managetype == "diary"){
		document.getElementById("puttop").innerHTML = "日记";
		
	}
	else if(managetype == "composition"){
		document.getElementById("puttop").innerHTML = "作文";
		
	}
	else if(managetype ==  "shareimage"){
		document.getElementById("puttop").innerHTML = "瞬间";
	}
}

function putdiary(index){
	statuidex = index;
	statuid = diarylist[statuidex].id;
	document.getElementById("managementtitle").innerHTML = diarylist[index].title;
	var strs = diarylist[index].text.split("<br>");
	document.getElementById("managementtext").innerHTML = "";
	for(i = 0;i<strs.length;i++){
		document.getElementById("managementtext").innerHTML  +="<p>" + strs[i] +"</p>"
	}
	managetype = "diary";
	putshare( diarylist[index].statu);
	puttop();
	getcomment();
}

function putcomposition(index){
	statuidex = index;
	statuid = compositionlist[statuidex].id;
	document.getElementById("managementtitle").innerHTML = compositionlist[index].title;
	var musicArray = new Array();
	var request=null;
	if(window.XMLHttpRequest){
		request=new XMLHttpRequest();
	}else if(window.ActiveXObject){
		request=new ActiveXObject("Microsoft.XMLHTTP");
	}
	if(request){
		request.open("GET",path+'/'+compositionlist[index].src,true);
		request.onreadystatechange=function(){
			if(request.readyState===4){
				if (request.status == 200 || request.status == 0){
					var str=request.responseText;
					var strs = str.split("\n");
					document.getElementById("managementtext").innerHTML  = "";
					var i = 0;
					for(i = 0;i<strs.length;i++){
						document.getElementById("managementtext").innerHTML  +="<p>" + strs[i] +"</p>"
					}
				}
			}
		}
	request.send(null);
	}else{
		alert("error");
	}
	managetype = "composition";
	putshare(compositionlist[index].statu);
	puttop();
	getcomment();
}

function putshareimage(index){
	statuidex = index;
	statuid =shareimagelist[statuidex].id;
	document.getElementById("managementtitle").innerHTML  = shareimagelist[index].title;
	document.getElementById("managementtext").innerHTML = 
		"<p align='center'><img height='180px' src='" + path + shareimagelist[index].src + "'><p>";
	managetype = "shareimage";
	putshare(shareimagelist[index].statu);
	puttop();
	getcomment();
}

function changestatu(){
	var tourl;
	var change;
	if(managetype == "diary"){
		tourl = "management_diarystatu.do";
		change = diarylist[statuidex].statu;
	}else if(managetype=="composition"){
		tourl = "management_compositionstatu.do";
		change = compositionlist[statuidex].statu;
	}else if(managetype == "shareimage"){
		tourl = "management_shareimagestatu.do";
		change = shareimagelist[statuidex].statu;
	}
	if(change == 1){
		change = 0;
	}else change = 1;
	
	$.ajax({
		type:"post",
		url:tourl,
		data:{
			"id":statuid,
			"statu":change
		},	
		success:function(result){
			if(change == 0)alert("取消分享成功");
			else alert("分享成功");
			if(managetype == "diary"){
				diarylist[statuidex].statu = change;
			}else if(managetype=="composition"){
				compositionlist[statuidex].statu = change;
			}else if(managetype == "shareimage"){
				shareimagelist[statuidex].statu = change;
			}
			putshare(change);
		}
	});
}




