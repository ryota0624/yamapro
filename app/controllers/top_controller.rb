class TopController < ApplicationController
  def index 
    @posts = Essay.where
			.not(question: true)
			.where(pickup_f: true).limit 3
    @essays  = Essay
      .where.not(question: true)
      .where(pickup_f: false).limit 3
    @posts_img = @posts.map {|essay|
      essay.img_id
    }
    @questions = Essay.sugest_essays current_user
    if params[:type] == "b"
      render :template => 'top/index_boot'
    end
  end
  
  def test 
    @questions = Essay.where(question: true).limit 5
    @articles = Essay.where(pickup_f: true)
			.where.not(question: true).limit 5
    @posts = Essay.where(pickup_f: false)
			.where.not(question: true).limit 5
    render :layout => false
  end
end