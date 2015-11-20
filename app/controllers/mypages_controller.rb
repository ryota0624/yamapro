class MypagesController < ApplicationController

  def index  # = show
    @essays = Essay.where(user_id: current_user.id)
    @essays_pickup = Essay.where(pickup_f: "true") #特集全て
    @user = User.find(current_user.id)
    @image = UserImage.where(user_id: current_user.id)
    work = TagUser.where(user_id: current_user.id)
    @tag = Usertag.where(id: work[0].tag_id)
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
      redirect_to my_list_mypages_path
    else
      add = User.add_mylist(current_user.id, session[:essay_id])
      if add
        redirect_to essay_path session[:essay_id]
        #redirect_to my_list_mypages_path
      end
    end
  end

  def destroy
    essay = Mylist.where(essay_id: params[:essay_id], user_id: current_user.id)[0]
    if essay.destroy then
      essay = Essay.find(params[:essay_id])
      redirect_to essay_path params[:essay_id]
    end
  end

  def my_list #記事のお気に入り
    @list = Mylist.where(user_id: current_user.id)
    @essaylist = @list.map {|listItem| listItem.essay }

    @essay_tags = Array.new
    @essaylist.each_with_index do |essay, i|
      middle = TagEssay.where(essay_id: essay.id)
      @essay_tags[i] = middle.map { |tag| Tag.find(tag.tag_id) }
    end
  end

  def get_user_image
    @image = UserImage.find(user_id: current_user.id)
    # logger.debug @image
    # send_data(@image.image, :disposition => "inline", :type => "image/jpeg")
  end

  # def my_fav #つぶやきのお気に入り
  #   fav = Fav.where(user_id: 3)
  #   @essaylist = @list.map {|listItem| listItem.essay }
  # end

  # def my_post
  # 	@my_posts = post.where(user: my_account)
  # end

end
