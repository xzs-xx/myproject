	var rows = 8;
	var page = 1;
	var initPage=false;//初始化整个页面 
	var initFlag = true;//是否初始化分页页码
	$(function(){  
	    //初始化页面
		var scondition=getCookie("scondition");	
		if(scondition!=null&&scondition!=undefined){
			$("#searchtext").attr("value",scondition);		
		}
		getDataList(0, null);
		
		/*------------------筛选-----------------*/
		$("#select1 dd").click(function () {
			$("#condition1").attr("value",$(this).text().trim());		
			$(this).addClass("selected").siblings().removeClass("selected");
			initFlag=true;
			getDataList(0,null);		
		});	
		$("#select2 dd").click(function () {
			$("#condition2").attr("value",$(this).text().trim());
			$(this).addClass("selected").siblings().removeClass("selected");
			initFlag=true;
			getDataList(0,null);
		});	
		$("#select3 dd").click(function () {
			$("#condition3").attr("value",$(this).text().trim());
			$(this).addClass("selected").siblings().removeClass("selected");
			initFlag=true;
			getDataList(0,null);
		});
		/*--------------排序---------------*/
		$("#order a").click(function(){
			$("#orderStr").attr("value",$(this).attr("id"));
			initFlag=true;
			getDataList(0,null);	
		});	
		
	});	
	function getDataList(currPage, jg) {			
		var typeName=$("#condition1").val();				
		var time=$("#condition2").val();
		var county=$("#condition3").val();	
		var order=$("#orderStr").val();
		var searchtext=$("#searchtext").val();				
	    $.ajax({            
	        url : "doPage.do",
	        async:initPage,
	        type : "post",
	        data : {'rows':rows,'page':currPage + 1,'typeName':typeName,'time':time,'county':county,'order':order,'searchtext':searchtext,'initPage':initPage},
	        contentType : "application/x-www-form-urlencoded; charset=utf-8",
	        success : function(response) {
	        	if(!initPage){	            			            		
	        		var typeList=response.typeList;
	        		for(var i=0;i<typeList.length;i++){
	        			$("#select1").append(
	        					"<dd id="+typeList[i].id+"><a href='javascript:void(0)'>" +
	        					typeList[i].name+"</a></dd>");
	        		}	            		
	        		initPage=true;
	        	}
	            if (response.result){                	
	                if (response.data != null && response.data != ""&& response.total != undefined && response.total > 0) {                   
	                    if (initFlag){
	                        $("#Pagination").pagination(
	                                response.total,
	                                {
	                                    items_per_page : rows,
	                                    num_edge_entries : 1,
	                                    num_display_entries : 5,
	                                    callback : getDataList//回调函数
	                                });
	                        initFlag = false;
	                    }
	                    $(".content").empty();
	                    loadDataList(response.data);
	                } else {                    	                       
	                }
	            } else {
	               $(".content").empty();
	               $("#Pagination").html("");
	               initFlag=true;
	            }
	        }
	    });
	}

	function loadDataList(listdata) { 		 			
	    for (var i = 0; i < listdata.length; i++) {
	        var n = listdata[i];                     
	        var html = "<li>"+	            					
	                        "<div class='c_img'><img src=http://"+n['picture']+"></div>"+
	                        "<div><p class='c_title'>"+n['cname']+"</p>"+
	                        "<p class='o_name'>"+n['oname']+"</p>"+
	                        "<p class='addr'>"+n['addr']+"</p></div>"+	                            
	                        "<div class='dbtn'><a href='javascript:void(0)'><button class='detail_btn' id="+
	                        n['cid']+" onclick='todetail(id)'>查看详情</button></a></div>"+
	                   "</li>";                      
	        $(".content").append(html);
	    }
	 }
	 /*----------------跳轉課程詳情頁-------------*/	
	 function todetail(id){
		 location.href="findCourse?id="+id;
	 }
	