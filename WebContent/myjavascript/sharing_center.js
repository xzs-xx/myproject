var diarytextelement = document.getElementById("diarymain");
var diary_img = document.getElementById("diary_img");
var composition_img = document.getElementById("composition_img");
var think_img = document.getElementById("think_img");
var shaping_img = document.getElementById("shaping_img");
var diaryshowpage =document.getElementById("diaryshowpage");
var compositionshowpage =document.getElementById("compositionshowpage");
var thinkshowpage = document.getElementById("thinkshowpage");
var shapingshowpage = document.getElementById("shapingshowpage");
var img_id = "diary_img";
var showpage_id = "diaryshowpage";
var date = new Date();
var fansuser = null;
document.getElementById("timeshow").innerHTML =
	date.getFullYear()+"年" + date.getMonth() +"月" + date.getDate() +"日";

function diaryonclick(){
	var title = $("#diarytitle").val();
	var str = (diarytextelement.innerHTML).replace(/<\/div>/g,"");
	str = str.replace(/<div>/g,"\n");
	$.ajax({
		type:"post",
		url:"adddiary.do",
		data:{
			"title":title,
			"text":str
		},	
		success:function(result){ 
			$("#diarytitle").val("");
			diarytextelement.innerHTML="";
			alert(result);
		}			
	}); 
}
function mOverimg(){
	diary_img.style.display="inline";
	composition_img.style.display="inline";
	think_img.style.display="inline";
	shaping_img.style.display="inline";
}
function mOutimg(){
	diary_img.style.display="none";
	composition_img.style.display="none";
	think_img.style.display="none";
	shaping_img.style.display="none";
	document.getElementById(img_id).style.display = "inline";
}
function changepage(img,showpage){
	img_id = img;
	showpage_id = showpage;
	diary_img.style.display="none";
	composition_img.style.display="none";
	think_img.style.display="none";
	shaping_img.style.display="none";
	document.getElementById(img_id).style.display = "inline";
	diaryshowpage.style.display="none";
	compositionshowpage.style.display="none";
	thinkshowpage.style.display="none";
	shapingshowpage.style.display="none";
	document.getElementById(showpage_id).style.display = "inline";
}

function compositiononclick(){
	var st=(document.getElementById("compositionmain").innerHTML).replace(/<\/div>/g,"");
	text = st.replace(/<div>/g,"\n");
	var title = $("#compositiontitle").val();
	$.ajax({
		type:"post",
		url:"composition.do",
		data:{
			"title":title,
			"text":text
		},	
		success:function(result){ 
			$("#compositiontitle").val("");
			document.getElementById("compositionmain").innerHTML = "";
			alert(result);
		}			
	}); 
}


var fileInput = document.getElementById("file");
var previewImg = document.getElementById('imgout');
fileInput.addEventListener('change', function () {
var file = this.files[0];
var reader = new FileReader();
// 监听reader对象的的onload事件，当图片加载完成时，把base64编码賦值给预览图片
reader.addEventListener("load", function () {
      previewImg.src = reader.result;
      }, false);
      // 调用reader.readAsDataURL()方法，把图片转成base64
      reader.readAsDataURL(file);
      //alert(fileout.value);
  }, false);

var sharingdiarylist = new Array();
var sharingcompositionlist = new Array();
var shareimagelist = new Array();
var sharingdiary = -1;
var sharingtype = "sharingdiary";
var commenttype = "diary";
var diarypath;
var id=null;
function initpath(src){
	diarypath = src;
}
function onclicksharing(str,type){
	sharingtype = str;
	commenttype = type;
	sharingdiary = -1;
	document.getElementById("diarytitle2").innerHTML="欢迎";
	document.getElementById("diarytext").innerHTML="大家好";
	document.getElementById('adddiarycomment').innerHTML = "";
	fansuser=null;
	id = null;
}
function onsharing(){
	document.getElementById("sharingdiary").style.display="inline";
	document.getElementById("sharingcomposition").style.display="inline";
	document.getElementById("sharingimage").style.display="inline";
}
function outsharing(){
	document.getElementById("sharingdiary").style.display="none";
	document.getElementById("sharingcomposition").style.display="none";
	document.getElementById("sharingimage").style.display="none";
	document.getElementById(sharingtype).style.display="inline";
}

function addsharingdiary(id,username,title,text,time){
	var data = {"id":id,"username":username,"title":title,"text":text,"time":time};
	sharingdiarylist.push(data);
}

function addsharingcomposition(id,username,title,src,time){
	var data = {"id":id,"username":username,"title":title,"src":src,"time":time};
	sharingcompositionlist.push(data);
}
function addshareimage(id,username,title,src,time){
	var data = {"id":id,"username":username,"title":title,"src":src,"time":time};
	shareimagelist.push(data);
}

function ondiary(diaryint){
	sharingdiary =sharingdiary + diaryint;
	var sharingsize = -1;
	if(commenttype=="diary"){
		sharingsize = sharingdiarylist.length;
	}else if(commenttype=="composition"){
		sharingsize = sharingcompositionlist.length;
	}else if(commenttype=="image"){
		sharingsize = shareimagelist.length;
	}
	if(sharingdiary < 0){
		sharingdiary = sharingdiary + 1;
		alert("没有上一页");
	}else if(sharingdiary >= sharingsize){
		sharingdiary = sharingdiary - 1;
		alert("没有下一页");
	}else{
		if(commenttype=="diary"){
			document.getElementById('diaryuser').innerHTML=sharingdiarylist[sharingdiary].username;
			fansuser=sharingdiarylist[sharingdiary].username;
			document.getElementById('diarytitle2').innerHTML="|" +sharingdiarylist[sharingdiary].title +"|";
			document.getElementById('diarytext').innerHTML = 
				(sharingdiarylist[sharingdiary].text).replace(/&lt;br&gt;/g,'<br>');
			id = sharingdiarylist[sharingdiary].id;
		}else if(commenttype=="composition"){
			musicArray = new Array();
			var request=null;
			if(window.XMLHttpRequest){
				request=new XMLHttpRequest();
			}else if(window.ActiveXObject){
				request=new ActiveXObject("Microsoft.XMLHTTP");
			}
			if(request){
				request.open("GET",diarypath+'/'+sharingcompositionlist[sharingdiary].src,true);
				request.onreadystatechange=function(){
					if(request.readyState===4){
						if (request.status == 200 || request.status == 0){
							var str=request.responseText;
							var strs = str.split("\n");
							document.getElementById('diarytext').innerHTML="";
							var j;
							for(j=0;j<strs.length;j++){
								document.getElementById('diarytext').innerHTML +="<p>" + strs[j] +"</p>";
							}

							document.getElementById('diaryuser').innerHTML=sharingcompositionlist[sharingdiary].username;
							fansuser=sharingcompositionlist[sharingdiary].username;
							document.getElementById('diarytitle2').innerHTML="|" +sharingcompositionlist[sharingdiary].title + "|";
						}
					}
				}
			request.send(null);
			}else{
				alert("error");
			}
			id=sharingcompositionlist[sharingdiary].id;
			
		}else if(commenttype=="image"){
			id=shareimagelist[sharingdiary].id;
			document.getElementById('diarytext').innerHTML="";
			document.getElementById('diarytext').innerHTML +="<img height='200px' src='"+ diarypath + shareimagelist[sharingdiary].src +"'>";
			document.getElementById('diaryuser').innerHTML=shareimagelist[sharingdiary].username;
			fansuser=shareimagelist[sharingdiary].username;
			document.getElementById('diarytitle2').innerHTML="|" + shareimagelist[sharingdiary].title + "|";
		}
		$.ajax({
			type:"post",
			url:"allcomment.do",
			data:{
				"id":id
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
}

function commentdiary(user){
	var commentdiary = $("#commentdiary").val();
	var id=null;
	if(commenttype=="diary"){
		id=sharingdiarylist[sharingdiary].id;
	}else if(commenttype=="composition"){
		id=sharingcompositionlist[sharingdiary].id;
	}else if(commenttype=="image"){
		id=shareimagelist[sharingdiary].id;
	}
	if(sharingdiary >-1){
		$.ajax({
			type:"post",
			url:"commentdiary.do",
			data:{
				"commenttype":commenttype,
				"commentdiary":commentdiary,
				"cid":id
			},	
			success:function(result){
				alert(result);
				document.getElementById('adddiarycomment').innerHTML += "<p>" + user + ":"
					+ commentdiary + "</p>";
				$("#commentdiary").val("");
			}			
		}); 
	}else {
		alert("还没看作品");
	}
}

function collection(){
	if(id!=null){
		$.ajax({
			type:"post",
			url:"collection.do",
			data:{
				"collectionid":id,
				"collectiontype":commenttype
			},	
			success:function(result){
				alert(result);
			}			
		}); 
	}else{
		alert("没有选择作品");
	}
}

function addfans(){
	if(fansuser!=null){
		$.ajax({
			type:"post",
			url:"fansuser.do",
			data:{
				"username":fansuser
			},	
			success:function(result){
				alert(result);
			}			
		}); 
	}
}

function changebodyuserp(){
	document.getElementById('bodyuserp').innerHTML = fansuser;
}


