class ExceptionLog < ApplicationRecord
  serialize :backtrace,Array
  serialize :data, Hash
  serialize :request, Hash
  serialize :session, Hash

  def app_backtrace
    backtrace.find_all{|item| item.include?(Rails.root.to_s)}[0]
  end
end
