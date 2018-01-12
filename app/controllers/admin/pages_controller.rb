class Admin::PagesController < Admin::BaseController
before_action :set_page, :only=>[:edit, :update, :destroy]
  def index
    @pages = Page.order(id: :desc).paginate(:page=> params[:page], :per_page=>Setting['default_per_page'] )
  end

  def new
    @page = Page.new
  end

  def create
    @page = Page.new(page_params)
    if @page.save
      redirect_to admin_pages_url, :notice=>'创建成功！'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @page.update(page_params)
      redirect_to admin_pages_url, :notice=> '编辑成功！'
    else
      render :edit
    end
  end

  def destroy
    @page.destroy
    redirect_to admin_pages_url, :notice=>'操作成功！'
  end

  private

  def set_page
    @page = Page.find(params[:id])
  end

  def page_params
    params.require(:page).permit(:name, :content, :image, :scope,
                                 seos_attributes:[:id, :seo_title, :seo_keywords, :seo_description, :_destroy] )
  end

end