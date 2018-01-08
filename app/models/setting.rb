# RailsSettings Model
class Setting < RailsSettings::Base
  source Rails.root.join("config/app.yml")
  namespace Rails.env
  attr_accessor :value_type

  def value_type
    value.class
  end
end
