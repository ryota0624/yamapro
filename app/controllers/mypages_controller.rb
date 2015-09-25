class MypagesController < ApplicationController

  def index
  	@essays = essay.where(pickup_f: false).limit(n)
  	@essays_pickup = essay.where(pickup_f: true).limit(n)
  	@posts = post.limit(n)
  end

  def my_essay
  	@my_essays = essay.where(user: my_account)
  end

  # def my_list
  # 	list = mylist.where(user: my_account)
  # 	@my_list = list.map( (item) => {
  # 		return item.essay;
  # 	}
  # end

  # def my_fav
  # 	fav = fav.where(user: my_account)
  # 	@my_list = fav.map( (item) => {
  # 		return item.post;
  # 	}
  # end

  # def my_post
  # 	@my_posts = post.where(user: my_account)
  # end

end
