var acolor = "red";

function changecolor(color){
	acolor = color;
}

function setcolor(obj){
	obj.setAttribute("fill",acolor);
	obj.style.display="inline";
}

function changedraw(draw){

	document.getElementById("draw3").style.display = "none";
	document.getElementById("draw4").style.display = "none";
	document.getElementById(draw).style.display = "block";
}
