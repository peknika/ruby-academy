class UsersController < ApplicationController
  def show
    @user = User.find_by(id: current_user.id)
    @posts = @user.posts.order(created_at: :desc)
  end

  def upload_avatar

  end
end
