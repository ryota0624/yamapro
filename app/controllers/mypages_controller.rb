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
    @essay_tags = @my_essays.map do |essay|
			essay.get_tags
		end
  end

  def add_my_list
    if Mylist.exists?(essay_id: session[:essay_id], user_id: current_user.id) #存在したらtrue お気に入りしてなければfalse
      redirect_to my_list_mypages_path
    else
      if User.add_mylist(current_user.id, session[:essay_id])
        redirect_to essay_path session[:essay_id]
			else
				redirect_to my_list_mypages_path
      end
    end
  end

  def destroy_my_list #お気に入り削除
    essay = Mylist.where(essay_id: params[:essay_id], user_id: current_user.id)[0]
    if essay.destroy
      redirect_to essay_path params[:essay_id]
    end
  end

  def my_list #記事のお気に入り
    @list = Mylist.where(user_id: current_user.id)
    @essaylist = @list.map {|listItem| listItem.essay }.compact
    @essay_tags = @essaylist.map do |essay|
			essay.get_tags
		end
    @pickup_img = @essaylist.map {|essay|
      essay.img_id
    }
  end

  def get_user_image
    @image = UserImage.find(user_id: current_user.id)
    send_data(@image.image, :disposition => "inline", :type => "image/jpeg")
  end
end
