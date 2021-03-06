class MypagesController < ApplicationController

  def index  # = show
    @essays = Essay.where(user_id: current_user.id)
    @essays_pickup = Essay.where(pickup_f: "true") #特集全て
    @user = User.find(current_user.id)
    @image = UserImage.where(user_id: current_user.id)
    work = TagUser.where(user_id: current_user.id)
    if work[0] then
      @tag = Usertag.where(id: work[0].tag_id)
    end
  end

  def my_essay
    @my_essays = Essay.where(user_id: current_user.id)
    @essay_tags = Array.new
    @my_essays.each_with_index do |essay, i|
      middle = TagEssay.where(essay_id: essay.id)
      @essay_tags[i] = middle.map { |tag| Tag.find(tag.tag_id) }
    end
  end

  def add_my_list
    if Mylist.exists?(essay_id: session[:essay_id], user_id: current_user.id) #存在したらtrue お気に入りしてなければfalse
			redirect_to "/essays/"+session[:essay_id]+"?page=1"
    else
      add = User.add_mylist(current_user.id, session[:essay_id])
      if add
        redirect_to "/essays/"+session[:essay_id]+"?page=1"
      end
    end
  end

  def destroy_my_list #お気に入り削除
    essay = Mylist.where(essay_id: params[:essay_id], user_id: current_user.id)[0]
    if essay.destroy
      essay = Essay.find(params[:essay_id])
			redirect_to "/essays/"+session[:essay_id]+"?page=1"
      # redirect_to essay_path params[:essay_id]
    end
  end

  def my_list #記事のお気に入り
    @list = Mylist.where(user_id: current_user.id)
    @essaylist = @list.map {|listItem| listItem.essay }.compact

    @essay_tags = Array.new
    @essaylist.each_with_index do |essay, i|
      middle = TagEssay.where(essay_id: essay.id)
      @essay_tags[i] = middle.map { |tag| Tag.find(tag.tag_id) }
    end
    pickup_img = @list.map {|essay| ImageEssay.where(essay_id: essay.id).first }
    @pickup_img = pickup_img.map {|essay|
      if essay.nil? then
        re = 0
      else
        re =  essay.id
      end
      re
    }
  end

  def get_user_image
    @image = UserImage.find(user_id: current_user.id)
    # logger.debug @image
    send_data(@image.image, :disposition => "inline", :type => "image/jpeg")
  end
end
