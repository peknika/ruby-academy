class FeedController < ApplicationController

  def index

    if current_user.following.exists?
      @posts = Post.where(user_id: current_user.following.pluck(:id)).order(created_at: :desc)
      return
    end

    @posts = Post.none
  end
end