class CommentsController < ApplicationController
  def new
    @comment = Comment.new
  end

  def create
    @post = Post.find(params[:post_id])
    @user = User.find(params[:user_id])
    @comment = @post.comments.build(comment_params)
    @comment.user = current_user

    if @comment.save
      # Increment comments_counter in the post
      @post.increment!(:comments_counter)
      redirect_to user_post_path(user_id: @user.id, id: @post.id), notice: 'Comment was successfully created.'
    else
      redirect_to user_post_path(user_id: @user.id, id: @post.id), alert: 'Failed to create comment.'
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
