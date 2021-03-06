class ArticlesController < ApplicationController

  before_action :article_id, only:[:show, :edit, :update, :destroy]

  def show
    #byebug
    #@article = Article.find(params[:id])
  end

  def index
    @articles = Article.paginate(page: params[:page], per_page: 3)
  end

  def new
    @article = Article.new
  end

  def edit
    #byebug
    #@article = Article.find(params[:id])
  end


  def create
    @article = Article.new(article_params)
    @article.user= User.first
    if @article.save
      flash[:notice] = "Article was created successfully"
      redirect_to (@article)
    else
      render 'new'
    end
  end

  def update
    #@article = Article.find(params[:id])
    if @article.update(article_params)
      flash[:notice] = "Article was updated successfully"
      redirect_to @article
    else
      render 'edit'
    end
  end

  def destroy
    #@article = Article.find(params[:id])
    @article.destroy
    redirect_to articles_path
  end


  private

  def article_id
    @article = Article.find(params[:id])
  end

  def article_params
    params.require(:article).permit(:title, :description)
  end
end
