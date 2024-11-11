class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
    @post = Post.new
  end

  def show
    @post = Post.find_by(id: params[:id])
    @user = @post.user
  end

  def edit
    @post = Post.find_by(id: params[:id])
  end

  def create
    @post = Post.new(create_params)
    @post.save
    redirect_to posts_index_path
  end

  def update
    @post = Post.find_by(id: params[:id])
    @post.update(update_params)
    @post.save
    redirect_to posts_index_path
  end

  def destroy
    @post = Post.find_by(id: params[:id])
    @post.destroy
    redirect_to posts_index_path
  end

  private

  def create_params
    params.require(:post).permit(:content).merge(user_id: @current_user.id)
  end

  def update_params
    params.require(:post).permit(:content)
  end

end
