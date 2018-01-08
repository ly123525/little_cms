class Admin::SettingsController < Admin::BaseController
  before_action :get_setting, only:[:edit, :update, :update_cache]
  def index
    @settings = Setting.get_all
  end

  def edit
  end

  def update
    value = convert_value_to(params[:setting][:value], params[:setting][:value_type] )
    if @setting.value != value
      @setting.value = value
      @setting.save
      redirect_to admin_settings_path, notice: '参数已更新.'
    else
      redirect_to admin_settings_path
    end
  end


  def update_cache
    %x{rake tmp:clear}
    redirect_to admin_settings_url, :notice=>'缓存清理成功!'
  end
  private

  def get_setting
    @setting = Setting.find_by(var:params[:id]) || Setting.new(var: params[:id])
  end

  def convert_value_to(value,value_type)
    case value_type
      when "String"
        value.to_s
      when "StringArray"
        value.split("|").map{|item| item.to_s}
      when "IntegerArray"
        value.split("|").map{|item| item.to_i}
      when "Boolean"
        value.to_bool
      when "Integer"
        value.to_i
      when "Float"
        value.to_f
      when "Date"
        value.to_date
      when "Datetime"
        value.to_datetime
      when "Hash"
        eval(value)
      else
        value.to_s
    end
  end

end