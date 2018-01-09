;(function($){
    $(function(){
        if($("#template_content").length>0) {
            var editor = CodeMirror.fromTextArea(document.getElementById("template_content"), {
                mode: "application/x-erb",
                lineWrapping: true,
                styleActiveLine: true, //line选择是是否加亮
                lineNumbers: true
            });
            editor.setSize('auto', 'auto');
        }
    });
})(jQuery);