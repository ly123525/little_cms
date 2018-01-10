# coding: utf-8
class ImagePreviewInput < SimpleForm::Inputs::FileInput

  def input(wrapper_options=nil)
    version = options.delete(:preview_version)
    change = options.delete(:change_preview) || false
    input_html_options[:class] << "js-preview-handle" if change

    out = ""
    out << "<div class='image_preview_position'><div class='preview_box'>"
    out << template.image_tag(object.send(attribute_name).tap {|o| break o.send(version) if version}.send('url'),:class=>"js-preview-image")
    out << "</div><div class='input_box'>"
    out << @builder.file_field("#{attribute_name}_cache",type: 'hidden')
    wrapper_options.delete(:class)
    out << super
    out << "</div></div>"

    out.html_safe

    # if object.send("#{attribute_name}?") || use_default_url
    #   out << template.image_tag(object.send(attribute_name).tap {|o| break o.send(version) if version}.send('url'))
    # end
    # out << @builder.input("#{attribute_name}_cache",as: 'hidden')
    # (out << super).html_safe
  end

end