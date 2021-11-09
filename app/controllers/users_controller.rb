# frozen_string_literal: true

# UsersController class
class UsersController < ApplicationController
  before_action :user_instance, except: %i[my_articles index show]

  def my_articles
    @pagy, @articles = pagy(current_user.articles.all)
  end

  def published_articles
    @pagy, @articles = pagy(@user.articles.all)
  end

  def index
    @pagy, @users = pagy(User.all)
  end

  def show
    @user = User.find(params[:user_id])
  end

  def follow
    current_user.follows.create(followable: @user) unless current_user == @user
    redirect_to user_my_profile_path(@user)
  end

  def unfollow
    @follow = Follow.where(followable: @user, follower: current_user)
    current_user.follows.destroy(@follow)
    redirect_to user_my_profile_path(@user)
  end

  def followers
    @followers = @user.followers
    @pagy, @followers = pagy(Follow.where(followable: @user))
  end

  def following
    @followings = @user.all_following
    @pagy, @followings = pagy(Follow.where(follower: @user))
  end

  private

  def user_instance
    @user = User.find(params[:id])
  end
end
