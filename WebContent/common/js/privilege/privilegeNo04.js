addListener(document, "click",
	function(evt) {
	    var evt = window.event ? window.event: evt,
	    target = evt.srcElement || evt.target;
	    var i=0;
	    while (target.nodeName.toLowerCase() != "html" && i<=3) {
			if(target.id != "hideDiv"){
				 target = target.parentNode;
				 i++;
			}else{
				return;
			}
        }
		  if(i==4||target.nodeName.toLowerCase() == "html"){
	           	if(!	$('#hideDiv').hasClass('hideDiv')){
			$('#hideDiv').addClass('hideDiv');
			    }
           }      
	});


function addListener(element, e, fn) {
    if (element.addEventListener) {
        element.addEventListener(e, fn, false);
    } else {
        element.attachEvent("on" + e, fn);
    }
}
function addBaby(e){
	$('#hideDiv').removeClass('hideDiv');
	// 关闭事件冒泡
	if (e.stopPropagation) { // 如果这个属性存在，则为IE
		e.stopPropagation();
	} else {
		e.cancelBubble = true; // 非IE使用此属性关闭冒泡
	}
	
}
function submitAddBaby(){
	var babyName=$("#babyName").val();
	// 向服务器发送
	var url = "/jsp/customerCenter/privilege/addBaby.do";
	var data={
		babyName:babyName
	};
	$.post(url, data, function(result) {
		if (result.data == true) {
			alert("添加成功！");

		} else {
			alert("添加失败。"+result.message);
		}
	});
}