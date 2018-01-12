;(function($){
    $(function(){
        var editor;
        Simditor.locale='zh-CN';
        return editor= new Simditor({
            textarea: $("#page_content"),
            toolbar:  ['title','bold', 'italic', 'underline','strikethrough','fontScale','color', 'ol', 'ul','blockquote', 'code', 'table', 'link', 'image', 'hr', 'indent', 'outdent', 'alignment'],
            upload: {
                url: "/attachments",
                params: null,
                fileKey: "attachment[file]",
                connectionCount: 1
            }
        });

    });
    //seo
    $(function(){
        $('#values_box').on('cocoon:after-insert',function(){
            if($('.nested-fields').length==1){
                $('.add_fields').hide();
            }
        }).on('cocoon:after-remove',function(){
            $('.add_fields').show();
        });
    });
})(jQuery);