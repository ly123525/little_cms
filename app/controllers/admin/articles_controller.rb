class Admin::ArticlesController < Admin::BaseController

  before_action :set_article, :only=>[:edit, :update, :destroy]
  before_action :set_article_category
  def index
    @articles = @article_category.articles.order(id: :desc).paginate(:page=> params[:page], :per_page=>Setting['default_per_page'])
  end

  def new
    @article = Article.new
    @article.build_seo
  end

  def create
    @article = Article.new(params[:article].permit!)
    @article.article_category = @article_category
    if @article.save
      redirect_to  admin_article_category_articles_url(@article_category), :notice=>'创建成功!'
    else
      render :new, :alert=>'创建失败!'
    end
  end

  def edit
    @article.seo
  end

  def update
    if @article.update(params[:article].permit!)
      redirect_to admin_article_category_articles_url(@article_category), :notice=>'修改成功!'
    else
      render :edit, :alert=>'修改失败!'
    end
  end

  def destroy
    @article.destroy
    redirect_to admin_article_category_articles_url(@article_category), :notice=>'操作成功!'
  end

  def update_position
    positions=params[:positions]
    ids=params[:ids]
    ids.each_with_index  do |id,index|
      position=positions[index].to_i
      Article.find(id).update(:position=> position)
    end
    respond_to do |format|
      format.json{render json: {success: :true} }
      format.js {flash.now.notice = '保存成功!'}
    end
  end


  private
  def set_article
    @article = Article.find(params[:id])
  end

  def set_article_category
    @article_category = ArticleCategory.find(params[:article_category_id])
  end
end