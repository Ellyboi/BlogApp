class UsersController < ApplicationController
  def index
    @users = User.order(posts_counter: :desc)
  end

  def show
    @user = User.find(params[:id])
    @recent_posts = @user.posts.order(created_at: :desc).limit(5)
  end
end
