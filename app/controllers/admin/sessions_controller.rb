class Admin::SessionsController < Admin::BaseController
  layout 'blank'
  skip_before_action :login, :except=>[:destroy]
  def new
  end

  def create
    admin = Admin.find_by(:email=>params[:email])
    if admin && admin.authenticate(params[:password])
      sign_in admin
      render json: {
          error: false,
          data: {
              url: admin_root_path
          }
      }
    else
      render json: {
          error: true,
          data: {
              message: '用户名或密码错误！'
          }
      }
    end

  end

  def destroy
    sign_out
    redirect_to admin_login_url, :notice=>'以安全退出管理账户!'
  end

  def verify_rucaptcha
    if verify_rucaptcha?
      render json: {
          error: false
      }
    else
      render json: {
          error: true,
          data: '验证码不正确！'
      }
    end
  end
end