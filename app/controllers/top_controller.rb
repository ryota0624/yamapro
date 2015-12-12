class TopController < ApplicationController
  def index 
    @posts = Essay.where
    .not(question: true).where(pickup_f: true).limit 3
    @essays  = Essay
    .where.not(question: true).where(pickup_f: false).limit 4
    post_img = @posts.map {|essay| ImageEssay.where(essay_id: essay.id).first }
    @posts_img = post_img.map {|essay|
      if essay.nil? then
        re = 0
      else
        re =  essay.id
      end
      re
    }
    @questions = Essay.where(question: true).where(pickup_f: true)
  end
  def test 
    @questions = Essay.where(question: true).limit 5
    @articles = Essay.where(pickup_f: true).where.not(question: true).limit 5
    @posts = Essay.where(pickup_f: false).where.not(question: true).limit 5
    render :layout => false
  end
end
