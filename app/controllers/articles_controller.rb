class ArticlesController < ApplicationController
  before_action :article_by_id, only: [:show, :edit, :update, :destroy]

  def index
    @articles = Article.all
  end

  def show
  end

  def new
    @article = Article.new
  end

  def create
    @article = Article.create(task_params)
    redirect_to articles_path(@article)
  end

  def edit
  end

  def update
    @article.update(task_params)
    redirect_to articles_path(@article)
  end

  def destroy
    @article.destroy
    redirect_to articles_path(@article)
  end

  private
  def article_by_id
    @article = Article.find(params[:id])
  end

  def task_params
    params.require(:article).permit(:title, :content)
  end
end
