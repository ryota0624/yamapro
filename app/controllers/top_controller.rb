class TopController < ApplicationController
  def index 
    @posts = Essay.where(pickup_f: true).limit(4)
    @essays = Essay.where(pickup_f: false).limit(4)
    essay_img = @essays.map {|essay| ImageEssay.where(essay_id: essay.id).first }
    @essay_img = essay_img.map {|essay|  
      if essay.nil? then 
        re = 0
      else
        re =  essay.id
      end
      re
    }
    logger.debug @essay_img
    @pickUps = Essay.where(pickup_f: true)
  end
end
