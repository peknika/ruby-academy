class LikesController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @post.likes.create(user_id: current_user.id)
    respond_to do |format|
      format.html { redirect_to @post }
      format.js
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    Like.where(post_id: @post.id, user_id: current_user.id).take&.destroy
    respond_to do |format|
      format.html { redirect_to @post }
      format.js
    end
  end
end