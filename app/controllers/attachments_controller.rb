class AttachmentsController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    @attachment = Attachment.new(params[:attachment].permit!)
    if @attachment.save
      render json:{
          success: true,
          msg: 'Upload success',
          file_path: "#{url_for(@attachment.file.url)}"
      }
    else
      render json:{
          success: false,
          msg: 'Upload failed'
      }
    end
  end

  def batch_upload
    @attachments=[]
    files=params[:files]
    begin
      files.each do |file|
        attachment=Attachment.create(:file=>file[1])
        @attachments << attachment
      end
      render :json=>{:success=>true,:msg=>"Upload success",:files=>files_data(@attachments)}
    rescue =>e
      render :json=>{:success=>false,:msg=>"Upload failed"}
    end
  end

  private
  def files_data(files)
    paths=[]
    files.each do |file|
      paths << {:id=>file.id,:file_path=>url_for(file.file.url)}
    end
    paths
  end
end