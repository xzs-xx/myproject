	var rows = 5;
	var page = 1;
	var initFlag = true;//是否初始化分页页码
	$(function(){		
	    //初始化页面		
		getDataList(0, null);
	
	});	
	
	function getDataList(currPage, jg) {
		
		 var searchtext =getCookie("scondition");
	    $.ajax({            
	        url : "doOrgListPage.do",
	        type : "post",
	        async:false,
	        data : {'rows':rows,'page':currPage + 1,'searchtext':searchtext,},
	        contentType : "application/x-www-form-urlencoded; charset=utf-8",
	        success : function(response) {	       	
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
//这边的内容替换一下
	function loadDataList(listdata) { 		 			
	    for (var i = 0; i < listdata.length; i++) {
	        var n = listdata[i];                     
	        var html = "<tr>"+	            					
	                        "<td class='c_img'><img src=http://"+n.logo+"></td>"+
	                        "<td><p class='c_title'>"+n.full_name+"</p>"+
	                        "<p class='o_name'></p>"+
	                        "<p class='addr'>"+n.county+n.addr_detail+"</p></td>"+	                            
	                        "<td class='dbtn'><a href='javascript:void(0)'><button class='detail_btn' id="+
	                        n.id+" onclick='toOrgdetail(id)'>查看详情</button></a></td>"+
	                   "</tr>";                      
	        $(".content").append(html);
	    }
	 }
	 /*----------------跳轉課程詳情頁-------------*/	
	 function toOrgdetail(id){
		 location.href="findOrg?id="+id;
	 }
	