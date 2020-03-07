

var isCommitted = false;//表单是否已经提交标识，默认为false
function dosubmit(){
	 if(isCommitted==false){
	     
	     return true;//返回true让表单正常提交
	 }else{
	     return false;//返回false那么表单将不提交
	 }
}
//提交申请
function apply(){
    var license=$("#yyzz_btn").val();	//营业执照
    var logo=$("#jgt_btn").val();     	//企业LOGO
    var linkname=$("#linkerName").val();       	//联系人
    var phone=$("#phone").val();    	//电话
    var full_name=$("#full_name").val();  	//机构全称
    var abbreviation=$("#abbreviation").val();  	//简称
    var	products_type=$("#products_type").val();//主营类别('有请选择')
    var	county=$("#county").val();//区县('有请选择')
    var	addr_detail=$("addr_detail").val();	//具体地址
    var email=$("#email").val();
    var phoneReg=/^1[34578]\d{9}$/;
    var reg = /^([a-z0-9A-Z]+[-|\.]?)+[a-z0-9A-Z]@([a-z0-9A-Z]+(-[a-z0-9A-Z]+)?\.)+[a-zA-Z]{2,}$/;
    if(email!=""){
        if(!reg.test(email)){
            layer.alert("email格式错误!");
            return;
        }
    }
   
    if(linkname==""){
    	layer.alert("联系人不能为空!");
    	return;
    }   
    if(!phoneReg.test(phone)){
    	layer.alert("手机号码有误请重新输入!");
    	return;
    }
    if(full_name==""){
    	layer.alert("机构全称不能为空!");
    	return;
    }
    if(abbreviation==""){
    	layer.alert("机构简称不能为空!");
    	return;
    }
    if(products_type=="请选择"){
    	layer.alert("请选择主营行业!");
    	return;
    }
    if(county=="请选择" || addr_detail==""){
    	layer.alert("机构地址有误!");
    	return;
    }    
    if(license==""){
    	layer.alert("请上传营业执照!");
    	return;
    }
    if(logo==""){
    	layer.alert("请上传机构图!");
    	return;
    }
   if(dosubmit()){
	   isCommitted = true;//提交表单后，将表单是否已经提交标识设置为true
	   $("#tijiao").text("申请提交中...").attr("disabled","disabled");
	   var form=new FormData(document.getElementById("myForm"));    	       
       $.ajax({
           type:"post",
           url:"addOrg.do",
           data:form,
           processData:false,
           contentType:false,
           success:function(data){
        	   isCommitted = false;//提交表单后，将表单是否已经提交标识设置为true
        	   //$("#tijiao").text("提交注册").attr({"disabled":false,"style":"color: gray"});
        	   $("#tijiao").text("提交注册").removeAttr("disabled");
        	   layer.alert(data);
               if(data=="提交申请成功!"){            	   
	               $("#myForm")[0].reset();
	               $("#yyzz").prop("src","");
	               $("#jgt").prop("src","");
	               $("#tijiao").attr({"disabled":false,"style":"color: gray"});
               }              
           }
       });  
   }
    
}


function checkchange(a){
    if(a.checked==true){
    	
        $("#tijiao").removeAttr("disabled").css({"color":"#fff","background":"#c8ac68"});
    }else{
    	
        $("#tijiao").attr({"disabled":true,"style":"color: gray"});
    }
}



$(
    function(){
        //上传营业执照
        $("#yyzz_btn").change(function(){
            var filepath=$("#yyzz_btn").val();
            if(isImage(filepath)){
                var objUrl = getObjectURL(this.files[0]);
                $("#yyzz").prop("src",objUrl);
            }
        });

        //上传logo
        $("#jgt_btn").change(function(){
            var filepath=$("#jgt_btn").val();
            if(isImage(filepath)){
                var objUrl = getObjectURL(this.files[0]);
                $("#jgt").prop("src",objUrl);
            }
        });

    }
);

//建立一個可存取到該file的url
function getObjectURL(file) {
    var url = null ;
    // 下面函数执行的效果是一样的，只是需要针对不同的浏览器执行不同的 js 函数而已
    if (window.createObjectURL!=undefined) { // basic
        url = window.createObjectURL(file) ;
    } else if (window.URL!=undefined) { // mozilla(firefox)
        url = window.URL.createObjectURL(file) ;
    } else if (window.webkitURL!=undefined) { // webkit or chrome
        url = window.webkitURL.createObjectURL(file) ;
    }
    return url;
}
//判断图片是否为图片
function isImage(filepath){
    var extStart = filepath.lastIndexOf(".");
    var ext = filepath.substring(extStart, filepath.length).toUpperCase();
    if (ext != ".BMP" && ext != ".PNG" && ext != ".GIF" && ext != ".JPG" && ext != ".JPEG") {
        layer.alert("图片限于bmp,png,gif,jpeg,jpg格式");
        return false;
    }else{
        return true;
    }

}
