(function($) {
    $.fn.image_change_preview = function() {
        return this.each(function() {
            var $field, $help, $image, $this;
            $this = $(this);
            $field = $this.parents(".js-image-field");
            $image = $field.find(".js-preview-image");
            $help = $field.find(".help-block:first");
            return $this.change(function() {
                var reader;
                if ($this.get(0).files && $this.get(0).files[0]) {
                    if ($this.get(0).files[0].type.indexOf("image") === -1) {
                        if ($help.length > 0) {
                            $help.text("请选择图片文件,gif/jpg/jpeg/png");
                        } else {
                            $help = $("<p class='help-block'>请选择图片文件,gif/jpg/jpeg/png</p>").appendTo($field);
                        }
                        $field.addClass("has-error");
                        return false;
                    }
                    reader = new FileReader();
                    reader.onload = function(e) {
                        $image.attr("src", e.target.result);
                        return $field.removeClass("has-error");
                    };
                    return reader.readAsDataURL($this.get(0).files[0]);
                }
            });
        });
    };
    return $(document).on('ready page:load', function() {
        return $('.js-preview-handle').image_change_preview();
    });
})(jQuery);