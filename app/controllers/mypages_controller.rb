class MypagesController < ApplicationController

  def index
    @essays = Essay.where(user_id: 3)
    @essays_pickup = Essay.where(pickup_f: "true") #特集全て
    @posts = Post.where(user_id: 3)
  end

  def my_essay
  	@my_essays = essay.where(user: 3)
  end

  def my_list #記事のお気に入り
    list = Mylists.where(params[:id])
    @my_list = list.push(essay_id: 3)

  	# list = mylist.where(user: my_account)
  	# @my_list = list.map( (item) => {
  	# 	return item.essay;
  	# }
  end

  def my_fav #つぶやきの
  # 	fav = fav.where(user: my_account)
  # 	@my_list = fav.map( (item) => {
  # 		return item.post;
  # 	}
  end

  def my_post
  	@my_posts = post.where(user: my_account)
  end

end
