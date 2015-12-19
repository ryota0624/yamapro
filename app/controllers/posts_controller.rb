class PostsController < ApplicationController
  def new
    @post = Post.new
  end
  def index
    @posts = Post.all
  end
  def create
    logger.debug(params)
    post= Post.create_post(params[:post][:content],current_user)
    if post
      redirect_to root_path
    else
      redirect_to new_posts_path
    end
  end
end
