module Admin::BaseHelper
  def show_setting_params(setting_key)
    output=content_tag :p,t("settings.#{setting_key}")
    params=t "settings.#{setting_key}_params"
    if params.class.to_s=="Hash"
      output << tag(:ul,{},true)
      params.keys.each do |key|
        output << content_tag(:li) do
          "<code>#{key}</code> #{params[key]}".html_safe
        end
      end
      output.safe_concat("</ul>")
    else
      output << content_tag(:p,params)
    end

  end

end