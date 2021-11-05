# frozen_string_literal: true

# UsersController class
class UsersController < ApplicationController
  def index
    @pagy, @users = pagy(User.all)
  end

  def show
    @user = User.find(params[:user_id])
  end

  def follow
    @user = User.find(params[:id])
    current_user.follows.create(followable: @user) unless current_user == @user
    redirect_to user_my_profile_path(@user)
  end

  def unfollow
    @user = User.find(params[:id])
    @follow = Follow.where(followable: @user, follower: current_user)
    current_user.follows.destroy(@follow)
    redirect_to user_my_profile_path(@user)
  end
end
