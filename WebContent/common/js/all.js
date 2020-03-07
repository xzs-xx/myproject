
$(
    function(){
        //------------------服务项目分类_隐藏-----------------
        var nav=1;
        $("#nav_1>span").click(
            function(){
                if(nav==0){
                    $("#nav_1 ul").slideUp(500);
                    nav=1;
                }else if(nav==1){
                    $("#nav_1 ul").slideDown(500);
                    nav=0;
                }

            }
        );
        $("#nav_1>img").click(
            function(){
                $("#nav_1>span").click();
            }
        );

        //--------------------个人中心_隐藏------------------
        var ge=1;
        $("#nav_2>span,#nav_2>img").click(
            function(){

            	location.href='/jsp/customerCenter/personal.html';

            }
        );

        //---------------------nav悬浮-------------------------
        var ss= 0,nav1,ge1;
        $(window).scroll(
            function(){
                var aa=$(window).scrollTop();
                if(aa>=700){
                    if(ss==0){
                        $(".nav").addClass("nav_fixed").css({"animation":"nav_fixed 0.5s linear forwards"});
                        $(".nav_fixed #nav_1 ul").hide();
                        $(".nav_fixed .gerenzhongxin").hide();
                        nav1=nav;
                        ge1=ge;
                        ss=1;nav=1;ge=1;
                    }
                }else{
                    if(ss==1){
                        $(".nav").removeClass("nav_fixed").css({"animation":"none"});
                        if(nav1==0){
                            $("#nav_1 ul").show();
                            nav=0;
                        }
                        if(ge1==0){
                            $(".gerenzhongxin").show();
                            ge=0;
                        }
                        ss=0;
                    }
                }
            }
        );
        
        
        
//        -----------------------top未开通功能提示------------------------
        $("#sjw").click(
        		function(){
        			layer.tips("功能尚未开通！敬请期待！","#sjw",{
        				tips:[3,'#cccccc'],
        			});
        		}
        );
        $("#andr").click(
        		function(){
        			layer.tips("功能尚未开通！敬请期待！","#andr",{
        				tips:[3,'#cccccc'],
        			});
        		}
        );
        $("#ios").click(
        		function(){
        			layer.tips("功能尚未开通！敬请期待！","#ios",{
        				tips:[3,'#cccccc'],
        			});
        		}
        );
        
        
        
        
    }
);
