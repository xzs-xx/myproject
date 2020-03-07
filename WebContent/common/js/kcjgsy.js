
$(
    function(){

        //--------------------左侧导航栏-----------------------
        $(".ke_1").click(
            function(){
                var aa=$(this).prop("id");
                if(aa=="ke_1"){
                    $(this).prop("id","ke_2").next("ul").slideUp(500);
                }else{
                    $(".ke_1").prop("id","ke_2").next("ul").slideUp(500);
                    $(this).prop("id","ke_1").next("ul").slideDown(500);
                }
            }
        );

    //    ------------------------右侧banner------------------------
        $(".c_right_banner>.go_left").click(
            function(){
                var cc=pointon-1;
                if(cc==0){cc=4}
                banner(cc);
            }
        );
        $(".c_right_banner>.go_right").click(
            function(){
                var cc=pointon+1;
                if(cc==5){cc=1}
                banner(cc);
            }
        );

    }
);

//------------------------------右侧benner-------------------------------
var pointon=1;
function banner(aa){
    $(".point>li").removeClass("point_on").eq(aa-1).addClass("point_on");

    if(pointon==1&&aa==4){aa=0;}
    else if(pointon==4&&aa==1){aa=5;}
    $(".banner_box").css({"transition":"0.5s linear","left":-aa*100+"%"});
    if(aa==0){
        aa=4;
        setTimeout(
            function(){
                $(".banner_box").css({"transition":"0s linear","left":-aa*100+"%"});
            },500
        )
    }else if(aa==5){
        aa=1;
        setTimeout(
            function(){
                $(".banner_box").css({"transition":"0s linear","left":-aa*100+"%"});
            },500
        )
    }
    pointon=aa;
}