# 异常通知
module ExceptionNotifier
  class DatabaseNotifier < ExceptionNotifier::BaseNotifier

    def initialize(options)
      super
      @default_options = options
    end
    def call(exception, options={})
      env = options[:env]
      options = options.reverse_merge(@default_options)

      error_class=exception.class.to_s
      message = exception.message.inspect.to_s
      backtrace = exception.backtrace
      data=(env && env['exception_notifier.exception_data'] || {}).merge(options[:data] || {})

      request_items=""
      session=""
      unless env.nil?
        request = ActionDispatch::Request.new(env)
        request_items = {:url => request.original_url,
                         :http_method => request.method,
                         :ip_address => request.remote_ip,
                         :parameters => request.filtered_parameters,
                         :timestamp => Time.current }
        session=request.session.to_hash
      end

      ExceptionLog.create(error_class: error_class, message: message,backtrace: backtrace,data: data,request:request_items,session: session)

    end
  end
end
