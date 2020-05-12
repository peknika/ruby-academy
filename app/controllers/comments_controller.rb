class CommentsController < ApplicationController

  def create
    @comment = Comment.new comment_params
    @comment.user_id = current_user.id
    if @comment.save
      redirect_back fallback_location: root_url
    end
  end

  def destroy
    @comment = Comment.find(params[:id])
    authorize @comment

      if @comment.destroy
        redirect_back fallback_location: root_url
      end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end
end
