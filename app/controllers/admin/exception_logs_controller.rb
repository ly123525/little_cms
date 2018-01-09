class Admin::ExceptionLogsController < Admin::BaseController

  def index
    @logs= ExceptionLog.order(id: :desc).paginate(:page=>params[:page],:per_page=>Setting['default_per_page'])
  end

  def show
    @log = ExceptionLog.find(params[:id])
  end

  def delete
    ids =params[:log_ids]
    if ExceptionLog.where(id: ids).delete_all
      flash[:notice]='删除成功!'
      redirect_referrer_or_default(admin_exception_logs_url)
    end
  end

  def delete_all
    ExceptionLog.delete_all
    flash[:notice]= '成功清除错误日志'
    redirect_referrer_or_default(admin_exception_logs_url)
  end

end