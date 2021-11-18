# frozen_string_literal: true

# ArticlesController class
class ArticlesController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @pagy, @articles = pagy(Article.where(status: 'public'))
  end

  # R method (CRUD)
  def show
    @article = Article.find(params[:id])
  end

  # C methods (CRUD)
  def new
    @article = Article.new
  end

  def create
    @article = current_user.articles.new(article_params)

    if @article.save
      redirect_to @article
    else
      render :new
    end
  end

  # U methods (CRUD)
  def edit
    @article = Article.find(params[:id])

    if @article.user_id == current_user.id
      render :edit
    else
      redirect_to @article
    end
  end

  def update
    @article = Article.find(params[:id])

    if @article.user_id == current_user.id && @article.update(article_params)
      redirect_to @article
    else
      render :edit
    end
  end

  # D methods (CRUD)
  def destroy
    @article = Article.find(params[:id])
    redirect_to root_path if @article.user_id == current_user.id && @article.destroy
  end

  private

  def article_params
    params.require(:article).permit(:title, :body, :status)
  end
end
