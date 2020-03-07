function upLoadCatchImg($file, $img) {
	//上传图片至缓存
	$file.change(function() {
				var filepath = $file.val();
				if (isImage(filepath)) {
					var objUrl = getObjectURL(this.files[0]);
					$img.attr("src", objUrl);
				}
			});
}
//建立一個可存取到該file的url
function getObjectURL(file) {
	var url = null;
	// 下面函数执行的效果是一样的，只是需要针对不同的浏览器执行不同的 js 函数而已
	if (window.createObjectURL != undefined) { // basic
		url = window.createObjectURL(file);
	} else if (window.URL != undefined) { // mozilla(firefox)
		url = window.URL.createObjectURL(file);
	} else if (window.webkitURL != undefined) { // webkit or chrome
		url = window.webkitURL.createObjectURL(file);
	}
	return url;
}
//判断图片是否为图片
function isImage(filepath) {
	var extStart = filepath.lastIndexOf(".");
	var ext = filepath.substring(extStart, filepath.length).toUpperCase();
	if (ext != ".BMP" && ext != ".PNG" && ext != ".GIF" && ext != ".JPG"
			&& ext != ".JPEG") {
		alert("图片限于bmp,png,gif,jpeg,jpg格式");
		return false;
	} else {
		return true;
	}

}