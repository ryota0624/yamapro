class MypagesController < ApplicationController

  def index  # = show
    @essays = Essay.where(user_id: current_user.id)
    # @essays = Essay.where(user_id: 3)
    @essays_pickup = Essay.where(pickup_f: "true") #特集全て
    # @user = User.where(user_id: current_user.id)
    @user = User.find(current_user.id)
  end

  def my_essay
  	@my_essays = Essay.find(params[:id])
    render template:"essays/index"
  end

  def my_list #記事のお気に入り
    @list = Mylist.where(user_id: current_user.id)
    @essaylist = @list.map {|listItem| listItem.essay }
  end

  # def my_fav #つぶやきのお気に入り
  #   fav = Fav.where(user_id: 3)
  #   @essaylist = @list.map {|listItem| listItem.essay }
  # end

  # def my_post
  # 	@my_posts = post.where(user: my_account)
  # end

end
