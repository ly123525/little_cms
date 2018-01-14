class Admin::ArticleCategoriesController < Admin::BaseController
before_action :set_article_category, :only=>[:edit, :update, :destroy]
  def index
    @article_categories = ArticleCategory.order(id: :desc).paginate(:page=>params[:page], :per_page=>Setting['default_per_page'])
  end

  def new
    @article_category = ArticleCategory.new
    @seo = @article_category.build_seo
  end

  def create
    @article_category = ArticleCategory.new(params[:article_category].permit!)
    @seo = @article_category.build_seo
    if @article_category.save
      redirect_to admin_article_categories_url, :notice=>'创建成功！'
    else
      render :new
    end
  end

  def edit
    @seo = @article_category.build_seo
  end

  def update
    @seo = @article_category.build_seo
    if @article_category.update(params[:article_category].permit!)
      redirect_to admin_article_categories_url, :notice=>'编辑成功！'
    else
      render :edit
    end
  end

  def destroy
    @article_category.destroy
    redirect_to :admin_article_categories_url, :notice=>'操作成功！'
  end


  private
  def set_article_category
    @article_category = ArticleCategory.find(params[:id])
  end
end