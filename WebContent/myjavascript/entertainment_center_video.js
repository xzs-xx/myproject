var myVideo;
var videoRange;
var change = 0;
myVideo =document.getElementById("video1");
videoRange = document.getElementById("videorange");
function playPause(){
	if (myVideo.paused){
		myVideo.play(); 
		document.getElementById("pausevideo").style.display="inline";
		document.getElementById("playvideo").style.display="none";
	}else {
		myVideo.pause(); 
		document.getElementById("playvideo").style.display="inline";
		document.getElementById("pausevideo").style.display="none";
	}
} 
document.getElementById("video1").ontimeupdate = function () {
	videoRange.value = 100*myVideo.currentTime/myVideo.duration;
}
function changescreen(){
	var sreenchange = document.getElementById("sreenchange");
	if(change == 0){
		change = 1;
		sreenchange.style.width="100%";
		sreenchange.style.left="0%";
		sreenchange.style.top="0%";
	}else{
		change = 0;
		sreenchange.style.width="40%";
		sreenchange.style.left="23%";
		sreenchange.style.top="19%";
	}
}


function progresschange(){
	myVideo.currentTime = (myVideo.duration * videoRange.value)/100
}