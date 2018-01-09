class Admin::DataBackupsController < Admin::BaseController
 before_action :get_backup_dir_path
  def index
  end

  def create
    %x{rake db:backup:create}
    redirect_to admin_data_backups_path, :notice=>'备份成功!'
  end

  def show
    send_file("#{@backup_folder}/#{params[:id]}.sql")
  end

  def destroy
    FileUtils.rm_rf("#{@backup_folder}/#{params[:id]}.sql")
    redirect_to admin_data_backups_path, notice=>'删除成功！'
  end


  private
  def get_backup_dir_path
    @backup_folder = "#{Rails.root}/#{File.join(ENV['DIR']||'db','backup')}"
  end
end