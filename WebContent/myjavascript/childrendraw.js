var acolor = "red";

function changecolor(color){
	acolor = color;
}

function setcolor(obj){
	obj.setAttribute("fill",acolor);
	obj.style.display="inline";
}


