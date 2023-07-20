class LikesController < ApplicationController
  def create
    @post = Post.find(params[:post_id])
    
    # Check if the user has already liked the post
    if @post.likes.where(user: current_user).exists?
      redirect_to user_post_path(user_id: params[:user_id], id: @post.id), alert: 'You have already liked this post.'
    else
      @like = Like.new(post: @post, user: current_user)

      if @like.save
        # Increment likes_counter in the post
        @post.increment!(:likes_counter)
        redirect_to user_post_path(user_id: params[:user_id], id: @post.id), notice: 'You liked this post!'
      else
        redirect_back(fallback_location: root_path, alert: 'Failed to like the post.')
      end
    end
  end
end
