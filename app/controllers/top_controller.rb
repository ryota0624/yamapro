class TopController < ApplicationController
  def index 
    @posts = Essay.where(pickup_f: true).limit 4
    @essays = Essay.where(pickup_f: false).limit 4
    @recommends = Essay.all.limit 4
    post_img = @posts.map {|essay| ImageEssay.where(essay_id: essay.id).first }
    @posts_img = post_img.map {|essay|  
      if essay.nil? then 
        re = 0
      else
        re =  essay.id
      end
      re
    }
    # logger.debug @essays.first
    logger.debug "&&&&&&&&&&&&&&&&&&"
    @pickUps = Essay.where(pickup_f: true)
  end
end
