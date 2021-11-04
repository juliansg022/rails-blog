# frozen_string_literal: true

# CommentsController class
class CommentsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]
  def create
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(comment_params.merge(user_id: current_user.id))
    redirect_to article_path(@article) if @comment.save
  end

  def destroy
    @article = Article.find(params[:article_id])
    @comment = @article.comments.find(params[:id])
    @comment.destroy if @comment.user_id == current_user.id
    redirect_to article_path(@article)
  end

  private

  def comment_params
    params.require(:comment).permit(:commenter, :body, :status)
  end
end
