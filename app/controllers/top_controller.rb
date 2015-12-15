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
     @questions = sugest_essays current_user
    if params[:type] == "b"
      render :template => 'top/index_boot'
    end
  end
  def test 
    @questions = Essay.where(question: true).limit 5
    @articles = Essay.where(pickup_f: true).where.not(question: true).limit 5
    @posts = Essay.where(pickup_f: false).where.not(question: true).limit 5
    render :layout => false
  end
  
  def sugest_essays(current_user)
    rankerEssay = Proc.new {
      if logged_in? 
        mylist = Mylist.group(:essay_id).count().to_a.sort {|a, b| -(a[1].to_i <=> b[1].to_i)}
        mylist.map { |essay_id|
          Essay.find_by id: essay_id[0]
        }.compact
      else
        Essay.where(question: true).limit 4
      end
    }
    if current_user.nil? then
      return rankerEssay.call
    end
    
    tag = current_user.tag_users.first
    if tag then
	   	userInfo = Usertag.find(tag.id)
	    parentsTags = Tag.where(name: userInfo.fage)
	    sugest_parent(parentsTags.first).concat sugest_parent parentsTags.last
    else
      rankerEssay.call
    end
  end
end

def sugest_parent(parent) 
  if parent.nil? then
    return []
  end
  parent.tag_essays.map {|tag|
    Essay.find_by(id: tag.essay_id)
	}.compact
end