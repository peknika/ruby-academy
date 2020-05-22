class CommentsController < ApplicationController

  def create
    @post = Post.find(params[:post_id])
    @comment = @post.comments.build(comment_params)
    @comment.user_id = current_user.id

    if @comment.save
      render :index
    end
  end

  def index
    @post = Post.find(params[:post_id])
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    @post = @comment.post.id
    authorize @comment

    if @comment.destroy
      respond_to do |format|
        format.html { redirect_to @post }
        format.js
      end
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content)
  end
end
