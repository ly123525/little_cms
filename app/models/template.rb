class Template < ApplicationRecord
  enum :content_type=>{:welcome_template=>0, :application_template=>1, :render_template=>2, :page_template=>3, :article_index_template=>4, :article_show_template=>5}
  validates :name, :file_name, :content_type, :presence => true
  validates :file_name, :uniqueness=>{message:'模板文件名称已经存在'}
  before_save :create_file_path
  after_destroy :delete_file

  private
#构造文件路径
  def create_file_path
    folder = template_folder
    path = File.join(folder, "#{self.file_name}.html.erb")
    if self.file_path != path
      delete_file
      self.file_path = path
    end
    create_file
  end


#创建文件
  def create_file
    file = File.open("#{Rails.root}/#{self.file_path}","w")
    file.puts self.content
    file.close
  end

# 删除文件
  def delete_file
    FileUtils.rm_rf(self.file_path) unless self.file_path.blank?
  end

#创建目录
  def template_folder
    if self.content_type=='application_template'
      template_folder = File.join(ENV['DIR']||'app','views', 'layouts')
    else
      template_folder = File.join(ENV['DIR']||'app','views', 'templates')
    end
    FileUtils.mkdir_p(template_folder)
    template_folder
  end
end

