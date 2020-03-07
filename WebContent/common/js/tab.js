function setTab(name, cursel) {
	cursel_0 = cursel;
	for (var i = 1; i <= links_len; i++) {
		var menu = document.getElementById(name + i);
		var menudiv = document.getElementById("con_" + name + "_" + i);
		if (i == cursel) {
			menu.className = "off";
			menudiv.style.display = "block";
		} else {
			menu.className = "";
			menudiv.style.display = "none";
		}
	}
}
function Next() {
	cursel_0++;
	if (cursel_0 > links_len)
		cursel_0 = 1
	setTab(name_0, cursel_0);
}
var name_0 = 'one';
var cursel_0 = 1;
var ScrollTime = 3000;//循环周期（毫秒）
var links_len;
$(function() {
	//var links = document.getElementById("tab1").getElementsByTagName('li')
	links_len = $(".menu>ul>li").length;
	setTab(name_0, cursel_0);
});