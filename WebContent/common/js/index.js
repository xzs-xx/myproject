
var c2=0;

//---------------banner图片轮播----------------
var ban=1;
var ban_play=ban+1;
function banner(aa){
    //$(".banner_img").animate({"left":-aa+"%"});
    $(".banner_jian>li").removeClass("banner_jian_on").eq(aa-1).addClass("banner_jian_on");
    if(ban==1&&aa==3){
        $(".banner_img").css({"transition":"0.8s linear","left":"0"});
        setTimeout(
            function(){
                $(".banner_img").css({"transition":"0s","left":"-300%"});
                ban=aa;
                ban_play=ban+1;
            },800
        );
        return false;
    }else if(ban==3&&aa==1){
        $(".banner_img").css({"transition":"0.8s linear","left":"-400%"});
        setTimeout(
            function(){
                $(".banner_img").css({"transition":"0s","left":"-100%"});
                ban=aa;
                ban_play=ban+1;
            },800
        );
        return false;
    }else{
        $(".banner_img").css({"transition":"0.8s linear","left":-aa*100+"%"});
        ban=aa;
        ban_play=ban+1;
        if(ban_play==4){ban_play=1}
    }

}



$(function(){
				$.post("loadRecommendNews.do",function(result){
					for(var i=0;i<3;i++){
						var j=i+1;
						if(i==0){
							var lj="info.edu.hc360.com/2017/08/301141774979.shtml";
						}else if(i==1){
							var lj="money.china.com/fin/sxy/201708/04/346808.html";
						}else if(i==2){
							var lj="fj.news.163.com/17/0815/16/CRT599IT04418MOP.html";
						}
						$(".c5_left").append(
								"<li>"+
			                    "<img src=http://"+result[i].cover +">"+
			                    "<div style='text-indent:1em;'>"+
			                    "<a href=http://"+lj+" target='_BLANK'>"+
			                        result[i].summary+
			                    "</a>"+
			                    "</div>"+
			                    "<div>"+
			                        "<img src='/common/images/index/xmt/"+j+".png'>"+
			                    "</div>"+
			                    "</li>"
											)
					}
					
				});
        		
                //-------------------回到顶部-------------------
                $(window).scroll(
                    function(){
                        var aa=$(window).scrollTop();
                        if(aa>=700){
                            $("#back_top").fadeIn(800);
                        }else{
                            $("#back_top").fadeOut(500);
                        }
                    }
                );

                $("#back_top").click(
                    function(){
                        $("body,html").animate({scrollTop: 0},1000);
                    }
                );

                //----------------------banner图片轮播------------------------
                $(".banner_jian>li").mouseover(
                    function(){
                        $(".banner_jian>li").removeClass("banner_jian_on");
                        $(this).addClass("banner_jian_on");
                        clearTimeout(banner_play);
                    }
                ).mouseout(
                    function(){
                        banner_play=setInterval(
                            function(){
                                banner(ban_play);
                            },5000
                        );
                    }
                );

                var banner_play=setInterval(
                    function(){
                        banner(ban_play);
                    },5000);
                
                
                //-----------------------video播放----------------------
                var vid=1;
                $(".video_play").click(
                		function(){
                			var aa=$(".c2_body video").prop("paused");
                			if(aa==true){
                				$(this).hide();
                				$("#video_img").hide();
                				$(".c2_body video").trigger("play");
                			}
                		}
                )
                $(".c2_body video").click(
                		function(){
                			var aa=$(".c2_body video").prop("paused");
                			if(aa==false){
                				$(".video_play").show();
                				$(".c2_body video").trigger("pause");
                			}
                		}
                )
                

                //-----------------------c1特权滑过效果--------------------
                
                $(".tequan").mouseenter(
                		function(){
                			$(this).children("div.shang,div.you,div.xia,div.zuo").css("animation","tqon 0.5s linear forwards");
                		}
                )
                $(".tequan").mouseleave(
                		function(){
                			$(this).children("div.shang,div.you,div.xia,div.zuo").css("animation","tqout 0.5s linear forwards");
                		}
                )
                

                //---------------------c6_底部鼠标划过---------------------
                $(".c6_bottom>li").mouseover(
                    function(){
                        $(".c6_bottom>li").removeClass("c6_bottom_on");
                        $(this).addClass("c6_bottom_on");
                 }); 
    });
