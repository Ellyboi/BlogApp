class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    first_post = Post.first
    User.second

    @comment = Comment.new(comment_params)
    @comment.author = current_user
    @comment.post = first_post

    if @comment.save
      redirect_to user_post_path(user_id: params[:user_id], id: params[:post_id])
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
