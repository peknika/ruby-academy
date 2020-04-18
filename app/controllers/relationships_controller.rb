class RelationshipsController < ApplicationController

  def create
    @followed = User.find(params[:id])
    current_user.follow(@followed)
    flash[:success] = "Start following #{@followed.full_name}"
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
  end

  def destroy
    @followed = Relationship.find(params[:id]).followed
    current_user.unfollow(@followed)
    respond_to do |format|
      format.html { redirect_to @user }
      format.js
    end
    flash[:success] = "Stopped following #{@followed.full_name}"
  end
end
