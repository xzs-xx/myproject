function personal(){
	window.location="personal_center.do";
}
function entertainment(){
	window.location="entertainment_center.do";
}
function creative(){
	window.location="creative_center.do";
}
function sharing(){
	window.location="sharing_center.do";
}

function management(){
	window.location="management_center.do";
}
function study(){
	window.location="study_center.do";
}
function drawpage(id,angle,rgba){
	var pagepersonal = document.getElementById(id);
	pagepersonal.setAttribute("fill",rgba);
	var str="M"+100 +" " + 100;
	str = str+" L" + (100 + 100*Math.cos(Math.PI*angle/180)) + " " + (100 + 100*Math.sin(Math.PI*angle/180));
	str=str+" A"+100 + " " + 100 +" " + 0 +" "+ 0 + " " + 1 + " " +
	(100 + 100*Math.cos(Math.PI*(angle+60)/180)) +" " + (100 + 100*Math.sin(Math.PI*(angle+60)/180));
	str=str + " L" + 100 + " " + 100 +" " + "Z";
	pagepersonal.setAttribute("d",str);
}
var anglepage = 0;
function a(){
	anglepage = (anglepage + 1)%360;
	drawpage("pageentertainment",270 + anglepage,"blue");
	drawpage("pagepersonal",330  + anglepage,"red");
	drawpage("pagesharing",30  + anglepage,"yellow");
	drawpage("pagemanagement",90  + anglepage,"rgba(220,20,60,0.1)");
	drawpage("pagestudy",150  + anglepage,"rgba(0,0,255,0.1)");
	drawpage("pagecreative",210  + anglepage,"rgba(128,0,128,0.1)");
}
var interval = setInterval(a,20);
function mOverstop(){
	clearInterval(interval);
}
function mOutstart(){
	interval = setInterval(a,20);
}

var str = "欢迎来到儿童教育网，这里会带给你全新的体验。";
var strlenght = 0;
var putcharinterval = setInterval(putcharall,100);
function putcharall(){
	document.getElementById("putchar").innerHTML += str[strlenght];
	strlenght = strlenght + 1;
	if(strlenght == str.length) clearInterval(putcharinterval);;
}


function mOverimage(obj,id){
	obj.style.width  = "28%";
	document.getElementById(id).style.display = "block";
}
function mOutimg(obj,id){
	obj.style.width  = "27%";
	document.getElementById(id).style.display = "none";
}