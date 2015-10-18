class User < ActiveRecord::Base

  # for authlogic
  acts_as_authentic do |c|
    c.login_field = :name
  end
  has_many :essays
  has_many :posts
  has_many :favs
  has_many :mylists
  has_one :image, class_name: "UserImage", dependent: :destroy
  
  accepts_nested_attributes_for :image, allow_destroy: true

  def add_mylist(essay_id)
    item = Mylist.new()
    item.user_id = self.id
    item.essay_id = essay_id
    item.save()
  end

  def fav_post(post_id)
    fav = Fav.new()
    fav.post_id = post_id
    fav.user_id = self.id
    fav.save;
  end

end
