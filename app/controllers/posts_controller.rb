class PostsController < ApplicationController
  def new
    @post = Post.new()
  end
  def create
    post= Post.create_post(params[:content],current_user)
    if post
      redirect_to root_path
    else
      redirect_to new_posts_path
    end
  end
end
