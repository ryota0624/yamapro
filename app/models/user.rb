class User < ActiveRecord::Base


  # for authlogic
  acts_as_authentic do |c|
    c.login_field = :name

  has_many :essays
  has_many :posts

  has_many :favs
  has_many :mylists

end
