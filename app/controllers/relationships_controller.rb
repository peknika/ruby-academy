class RelationshipsController < ApplicationController

  def create
    @followed = User.find(params[:id])
    current_user.follow(@followed)
    flash[:success] = "Now following #{@followed.full_name}"
    redirect_back fallback_location: root_path
  end

  def destroy
    @followed = Relationship.find(params[:id]).followed
    current_user.unfollow(@followed)
    flash[:success] = "Stopped following #{@followed.full_name}"
    redirect_back fallback_location: root_path
  end
end
