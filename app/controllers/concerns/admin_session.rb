module Concerns
  module AdminSession

   def self.included base
     base.class_eval do
       helper_method :sign_in?
       helper_method :current_admin
     end
   end

    def sign_in admin
      session[:admin_id]=admin.id
    end

    def sign_in?
      !!session[:admin_id]
    end

    def current_admin
      if sign_in?
        @current_admin ||= Admin.find_by(:id=>session[:admin_id])
      else
        nil
      end
    end

    def login
      unless sign_in?
        redirect_to admin_login_path
      end
    end

    def sign_out
      session[:admin_id]=nil
      @current_admin = nil
    end

   # 跳转到来源页面地址或默认地址
   def redirect_referrer_or_default(default)
     redirect_to(request.referrer || default)
   end

  end
end