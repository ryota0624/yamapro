class TopController < ApplicationController
  def index 
    @posts = Post.limit(5).order("created_at ASC")
    @essays = Essay.where(pickup_f: false)
    @pickUps = Essay.where(pickup_f: true)
  end
end
