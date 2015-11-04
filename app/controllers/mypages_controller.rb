class MypagesController < ApplicationController

  def index  # = show
    @essays = Essay.where(user_id: current_user.id)
    @essays_pickup = Essay.where(pickup_f: "true") #特集全て
    @user = User.find(current_user.id)
    @image = UserImage.where(user_id: current_user.id)
  end

  def my_essay
  	@my_essays = Essay.find(params[:id])
    render template:"essays/index"
  end

  def add_my_list
    if Mylist.exists?(essay_id: session[:essay_id], user_id: current_user.id) #存在したらtrue お気に入りしてなければfalse

      redirect_to my_list_mypages_path
    else
      add = User.add_mylist(current_user.id, session[:essay_id])
      if add
        redirect_to my_list_mypages_path
      end
    end
  end

  def my_list #記事のお気に入り
    @list = Mylist.where(user_id: current_user.id)
    @essaylist = @list.map {|listItem| listItem.essay }
  end

  def my_list_special #記事のお気に入り
    @list = Mylist.where(user_id: current_user.id)
    @essaylist = @list.map {|listItem| listItem.essay }
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
