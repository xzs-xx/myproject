$(
    function(){
        $(".c_nav>ul>li").click(
            function(){
                var aa=$(this).prop("id");
                if(aa=="pingjia"){return false}
                $(".c_box>div").hide();
                $("."+aa).show();
            }
        )
    }
);
