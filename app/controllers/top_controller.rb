class TopController < ApplicationController
  def index 
    @recommends = TagEssay.where(tag_id: 1).limit(4).map do |tag|
      tag.essay
    end

    essays = TagEssay.where.not(tag_id: 1).map do |tag|
      tag.essay
    end
    @posts = Essay.where(pickup_f: true).slice(0, 3)
    @essays  = Essay.where(pickup_f: false).slice(0, 4)

    post_img = @posts.map {|essay| ImageEssay.where(essay_id: essay.id).first }
    @posts_img = post_img.map {|essay|  
      if essay.nil? then 
        re = 0
      else
        re =  essay.id
      end
      re
    }
    @pickUps = Essay.where(pickup_f: true)
  end
end
