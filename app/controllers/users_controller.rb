class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @posts = @user.posts.order(created_at: :desc)
  end

  def upload_avatar
    @user = User.find_by(id: current_user.id)
    @user.update_attributes(user_params)
    if @user.save
      redirect_back fallback_location: root_url
      flash[:success] = "Nice one!"
    end
  end

  private

  def user_params
    params.require(:user).permit(:avatar)
  end
end
