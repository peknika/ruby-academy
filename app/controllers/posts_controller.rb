class PostsController < ApplicationController

  def index
    @posts = Post.all.limit(20)
  end

  def new
    @post = Post.new
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to @post , flash: { success: "Post published!" }
      return
    end

    render :new, flash: { alert: "Error" }
  end

  def destroy
    @post = Post.find(params[:id])
    authorize @post

    if @post.destroy
      redirect_back fallback_location: root_url
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  private

  def post_params
    params.require(:post).permit(:image, :description)
  end
end
