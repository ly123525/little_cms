;(function($){
    $(function(){
        var editor2;
        Simditor.locale='zh-CN';
        return editor2= new Simditor({
            textarea: $("#article_category_description"),
            toolbar:  ['title','bold', 'italic', 'underline','strikethrough','fontScale','color', 'ol', 'ul','blockquote', 'code', 'table', 'link', 'image', 'hr', 'indent', 'outdent', 'alignment'],
            upload: {
                url: "/attachments",
                params: null,
                fileKey: "attachment[file]",
                connectionCount: 1
            }
        });

    });
})(jQuery);