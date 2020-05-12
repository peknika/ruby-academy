class LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @post.likes.create(user_id: current_user.id)
    redirect_back fallback_location: root_path
  end

  def destroy
    Like.where(post_id: params[:post_id], user_id: current_user.id).take&.destroy
    redirect_back fallback_location: root_path
  end
end