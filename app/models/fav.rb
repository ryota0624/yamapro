class Fav < ActiveRecord::Base
  belongs_to :post
  belongs_to :user

  def Fav.post_to_fav(user_id, post_id)
    fav = Fav.new()
    fav.user_id = user_id
    fav.post_id = post_id
    fav.save()
  end
end
