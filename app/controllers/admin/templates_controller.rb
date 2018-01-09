class Admin::TemplatesController < Admin::BaseController
  before_action :set_template, :only=>[:edit, :update, :destroy]
  def index
    @templates = Template.order(id: :desc).paginate(:page=>params[:page], :per_page=>Setting['default_per_page'])
  end

  def new
    @template = Template.new
  end

  def create
    @template = Template.new(params[:template].permit!)
    if @template.save
      redirect_to admin_templates_url, :notice=>'创建成功！'
    else
      render :new, :alert=>'创建失败！'
    end
  end

  def edit
  end

  def update
    if @template.update(params[:template].permit!)
      redirect_to admin_templates_url, :notice=>'编辑成功！'
    else
      render :edit
    end
  end

  def destroy
    @template.destroy
    redirect_to admin_templates_url, :notice=>'操作成功！'
  end

  private
  def set_template
    @template = Template.find(params[:id])
  end
end