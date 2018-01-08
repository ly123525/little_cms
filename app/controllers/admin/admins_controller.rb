class Admin::AdminsController < Admin::BaseController

  def edit
    @admin = Admin.find(params[:id])
  end

  def update
    @admin = Admin.find(params[:id])
    if current_admin.update_with_password(params[:admin].permit!)
      redirect_to admin_root_path, :notice=>'密码修改成功！'
    else
      render :edit
    end
  end
end