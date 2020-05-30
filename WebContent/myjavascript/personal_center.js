var indexcollection;
var collectionlist = new Array();
var path = null;
var ws = null;
var username = null;
function initpath(src){
	path = src;
}
function addusercollection(id,collectionuser,collectionid,collectiontype,collectiontime){
	var data = {'id':id,'collectionuser':collectionuser,'collectionid':collectionid,
			'collectiontype':collectiontype,'collectiontime':collectiontime};
	collectionlist.push(data);
}

function putall(str,name){
	document.getElementById("putdiary").style.display="none";
	document.getElementById("putcomposition").style.display="none";
	document.getElementById("putimage").style.display="none";
	document.getElementById(str).style.display="inline";
	document.getElementById("putselect").innerHTML = name;
}

function gocollection(){
	if(collectionlist.length > 0){
		if(collectionlist[indexcollection].collectiontype == "diary") {
			savediary(collectionlist[indexcollection].collectionid);
		}else if(collectionlist[indexcollection].collectiontype == "image"){
			saveimage(collectionlist[indexcollection].collectionid);
		}else if(collectionlist[indexcollection].collectiontype == "composition"){
			savecomposition(collectionlist[indexcollection].collectionid);
		}
	}
}

function init(){
	indexcollection = 0;
	gocollection();
}

function savediary(collectionid){
	putall("putdiary","日记");
	$.ajax({
		type:"post",
		url:"seeusercollection.do",
		data:{
			"id":collectionid
		},	
		success:function(result){
			document.getElementById("collectiontitle").innerHTML = result.title;
			document.getElementById("collectiontext").innerHTML = result.text;
			document.getElementById("collectionusername").innerHTML = result.username;
		}		
	});
}

function savecomposition(collectionid){
	putall("putcomposition","作文");
	$.ajax({
		type:"post",
		url:"seeusercollectioncomposition.do",
		data:{
			"id":collectionid
		},	
		success:function(result){
			var musicArray = new Array();
			var request=null;
			if(window.XMLHttpRequest){
				request=new XMLHttpRequest();
			}else if(window.ActiveXObject){
				request=new ActiveXObject("Microsoft.XMLHTTP");
			}
			if(request){
				request.open("GET",path+'/'+result.src,true);
				request.onreadystatechange=function(){
					if(request.readyState===4){
						if (request.status == 200 || request.status == 0){
							var str=request.responseText;
							var strs = str.split("\n");
							document.getElementById("collectiontitle").innerHTML = result.title;
							document.getElementById("collectiontext").innerHTML = "";
							var i = 0;
							for(i = 0;i<strs.length;i++){
								document.getElementById("collectiontext").innerHTML +="<p>" + strs[i] +"</p>"
							}
							document.getElementById("collectionusername").innerHTML = result.username;
						}
					}
				}
			request.send(null);
			}else{
				alert("error");
			}
		}		
	});
}

function saveimage(collectionid){
	putall("putimage","精彩");
	$.ajax({
		type:"post",
		url:"seeusercollectionimage.do",
		data:{
			"id":collectionid
		},	
		success:function(result){
			document.getElementById("collectiontitle").innerHTML = result.title;
			document.getElementById("collectiontext").innerHTML = '<img width="100%" src = "'+ path + result.src + '">';
			document.getElementById("collectionusername").innerHTML = result.username;
		}		
	});
}

function pospage(pos){
	indexcollection = indexcollection + pos;
	if(indexcollection<0){
		indexcollection = indexcollection + 1;
	}else if(indexcollection >= collectionlist.length){
		indexcollection = indexcollection - 1;
	}else {
		gocollection();
	}
}

function showspeak(){
	document.getElementById("speakcollection").style.display='inline';
}

var gotos = 0;
var mytime;
function onspeak(){
	gotos = 0;
	document.getElementById("putspeak").style.left = "" + gotos + "%";
	document.getElementById("putspeaktext").innerHTML = $("#pspeaktext").val();
	mytime = setInterval(gospeak, 100);
	comment();
	$("#pspeaktext").val("");
	document.getElementById("speakcollection").style.display='none';
}

function gospeak(){
	gotos = gotos + 1;
	document.getElementById("putspeak").style.left = "" + gotos + "%";
	if(gotos>60){
		clearInterval(mytime);
	}
}

function comment(){
	$.ajax({
		type:"post",
		url:"commentdiary.do",
		data:{
			"commenttype":collectionlist[indexcollection].collectiontype,
			"commentdiary": $("#pspeaktext").val(),
			"cid":collectionlist[indexcollection].collectionid
		},	
		success:function(result){
			alert(result);
		}			
	}); 
}

var speakname = null;
function returncommunication(){
	$.ajax({
		type:"post",
		url:"findCommunication.do",
		data:{
			"activeusername":speakname
		},	
		success:function(result){
			var i = 0;
			document.getElementById("communicationput").innerHTML = "";
			for(i=0;i<result.length;i++){
				if(result[i].activeusername==speakname){
					document.getElementById("communicationput").innerHTML +=
						"<p align='left'>" + result[i].activeusername + ":" + result[i].speaktext + "</p>";
				}else{
					document.getElementById("communicationput").innerHTML +=
						"<p align='right'>" + result[i].speaktext + ":" + result[i].activeusername + "</p>";
				}
			}
		}			
	}); 
}
function setcommunicationname(gospeakname){
	speakname = gospeakname;
	returncommunication();
}

function communicationspeak(){
	ws.send(speakname + "|" + $("#communicationtext").val());
	$.ajax({
		type:"post",
		url:"communicationspeak.do",
		data:{
			"activeusername":speakname,
			"communicationtext":$("#communicationtext").val()
		},	
		success:function(result){
			document.getElementById("communicationput").innerHTML+=
				"<p align='right'>" + $("#communicationtext").val() + ":" + result +"</p>";
			$("#communicationtext").val("");
		}			
	});
	
}

function delcollection(){
	$.ajax({
		type:"post",
		url:"delcollection.do",
		data:{
			"id":collectionlist[indexcollection].id
		},	
		success:function(result){
			alert("取消收藏成功");
			window.location = result;
		}			
	}); 
}

function initwebsocket(name){
	username = name;
	websocket();
}
function websocket(){
	ws = new WebSocket("ws://localhost:8080/myssm/websocket/"+username);
	ws.onopen = function(){
	};
	ws.onclose = function(){
		 alert("不在线，对方接受不到信息");
	};
	ws.onmessage = function (evt) { 
		var received_msg = evt.data;
		document.getElementById("communicationput").innerHTML +=
			"<p align='left'>" +speakname +":" + received_msg + "</p>";
	};
	ws.onerror = function() {
		
	};
} 





