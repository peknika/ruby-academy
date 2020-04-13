class CommentsController < ApplicationController
  def create
    @comment = Comment.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_back fallback_location: post_path(@comment.post_id)
    end
  end

  def destroy

  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id)
  end

end
