;(function($){
    //全选
    $(function() {
        $("#check_all").on('click',function() {
            if($(this).prop('checked')){
                $('.check_submit_btn').show();
                $("input.check_one:checkbox").each(function() {
                    $(this).prop("checked", true);
                });
            }else{
                $('.check_submit_btn').hide();
                $("input.check_one:checkbox").each(function() {
                    $(this).prop("checked", false);
                });
            }
        });
        $("input.check_one:checkbox").on('click',function(){
            if($(this).prop('checked')){
                $('.check_submit_btn').show();
            }else{
                $('.check_submit_btn').hide();
            }
        })
    });
})(jQuery);