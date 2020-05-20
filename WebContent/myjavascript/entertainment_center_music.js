var musicindex = -1;
var maxmusicindex;
var path = null;
function inita(src){
	path = src;
}
function playmusic(src,index){
	musicindex = index;
	document.getElementById("playmusic").pause();
	document.getElementById("playmusicam").src=src;
	document.getElementById("playmusicao").src=src;
	document.getElementById("playmusicem").src=src;
	document.getElementById("playmusic").load();
	document.getElementById("playmusic").play();
}
var musicArray = new Array();
function lrcchange(lrc) {
	musicArray = new Array();
	var request=null;
	if(window.XMLHttpRequest){
		request=new XMLHttpRequest();
	}else if(window.ActiveXObject){
		request=new ActiveXObject("Microsoft.XMLHTTP");
	}
	if(request){
		request.open("GET",lrc,true);
		request.onreadystatechange=function(){
			if(request.readyState===4){
				if (request.status == 200 || request.status == 0){
					var str=request.responseText;
					var strs = str.split("\n");
					$.each(strs, function (i, item) {
						var t = item.substring(item.indexOf("[") + 1, item.indexOf("]"));
						musicArray.push({
						     t: (t.split(":")[0] * 60 + parseFloat(t.split(":")[1])).toFixed(3),
						     c: item.substring(item.indexOf("]") + 1, item.length)
						});
					});
				}
			}
		}
		request.send(null);
		}else{
			alert("error");
		}
	}

document.getElementById("playmusic").ontimeupdate = function () {
	var currenttime=document.getElementById("playmusic").currentTime;
	document.getElementById("musicbar").style.width=""+ currenttime/document.getElementById("playmusic").duration * 100 + "%";
	var timeindex = 0;
	for(i = 0;i < musicArray.length;i++){
		var time = parseFloat(musicArray[i].t);
		if(time > currenttime){
			timeindex = i;
			break;
		}
	}
	if(timeindex>1  && musicArray.length - 2>timeindex)document.getElementById("text1").innerHTML=musicArray[timeindex - 2].c;
	if(timeindex>0 && musicArray.length - 1>timeindex)document.getElementById("text2").innerHTML=musicArray[timeindex - 1].c;
	if(musicArray.length>timeindex)document.getElementById("text3").innerHTML=musicArray[timeindex + 0].c;
	if(musicArray.length + 1>timeindex)document.getElementById("text4").innerHTML=musicArray[timeindex + 1].c;
	if(musicArray.length + 2>timeindex)document.getElementById("text5").innerHTML=musicArray[timeindex + 2].c;
	if(musicArray.length + 3>timeindex)document.getElementById("text6").innerHTML=musicArray[timeindex + 3].c;
}
function thismusicpause(){
	document.getElementById("thismusicplay").style.display = "inline";
	document.getElementById("thismusicpause").style.display = "none";
	var music = document.getElementById("playmusic");
	music.pause();
}
function thismusicplay(){
	document.getElementById("thismusicpause").style.display = "inline";
	document.getElementById("thismusicplay").style.display = "none";
	var music = document.getElementById("playmusic");
	music.play();
}
function hismusicback(){
	var time = document.getElementById("playmusic").currentTime
	if(time > 10)document.getElementById("playmusic").currentTime = time - 10;
}
function hismusicfast(){
	var time = document.getElementById("playmusic").currentTime
	if(time + 10 < document.getElementById("playmusic").duration)
		document.getElementById("playmusic").currentTime = time + 10;
}



////通信代码
var ws = null;
ws = new WebSocket("ws://localhost:8080/myssm/websocket");
ws.onopen = function(){
	// Web Socket 已连接上，使用 send() 方法发送数据
	//alert("数据发送中...");
};
ws.onmessage = function (evt) { 
	var received_msg = evt.data;
	//alert("数据已接收...");
	//alert(received_msg);
	document.getElementById("addspeak").innerHTML +=
	'<div style="width:100%;height:70px;">'+
		'<div style="position:absolute;">'+
			'<img src="'+ path +'/myimage/白云对话框.png" width="100%">'+
		'</div>'+
		'<p style="position:absolute;margin-top:20px;font-size:20px;margin-left:20px;">'+ received_msg + '</p>'+
	'</div>';
	};
ws.onclose = function(){ 
	// 关闭 websocket
	//alert("连接已关闭..."); 
};
 ws.onerror = function() {
	alert("错误");
}; 

function clicksend(){
	if(ws.readyState === ws.CLOSED){
		ws = new WebSocket("ws://localhost:8080/myssm/websocket");
	}else{
		ws.send($("#musicplaytext").val());
		$("#musicplaytext").val("");
	}
}
