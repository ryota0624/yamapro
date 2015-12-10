class User < ActiveRecord::Base
  validates :name,     length: { minimum: 3 } 
  validates :password, length: { minimum: 4 }

  # for authlogic
  acts_as_authentic do |c|
    c.login_field = :name
  end
  has_many :essays , :dependent => :destroy
  has_many :posts , :dependent => :destroy
  has_many :favs , :dependent => :destroy
  has_many :mylists , :dependent => :destroy
  has_one :image, class_name: "UserImage", dependent: :destroy
  has_many :tag_users , :dependent => :destroy

  accepts_nested_attributes_for :image, allow_destroy: true
  accepts_nested_attributes_for :tag_users, allow_destroy: true

  validates_acceptance_of :confirming
  after_validation :check_confirming

  def check_confirming
    errors.delete(:confirming)
    self.confirming = errors.empty? ? "1" : "0"
  end

  def User.add_mylist(user_id, essay_id)
    item = Mylist.new()
    item.user_id = user_id
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
