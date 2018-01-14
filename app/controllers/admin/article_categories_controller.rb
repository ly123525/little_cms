class Admin::ArticleCategoriesController < Admin::BaseController
before_action :set_article_category, :only=>[:edit, :update, :destroy]
  def index
    @article_categories = ArticleCategory.nested_set_scope
  end

  def new
    @article_category = ArticleCategory.new
    @seo = @article_category.build_seo
  end

  def create
    @article_category = ArticleCategory.new(params[:article_category].permit!)
    if @article_category.save
      redirect_to admin_article_categories_url, :notice=>'创建成功！'
    else
      render :new
    end
  end

  def edit
     @seo=@article_category.seo
  end

  def update
    if @article_category.update(set_category_params)
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

  def set_category_params
    params.require(:article_category).permit(:parent_id, :image, :name, :scope_index,
                                             :scope_index, :scope_show,
                                              seo_attributes:[:id, :seo_title, :seo_keywords, :seo_description, :_destroy])
  end
end