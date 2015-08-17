class User < ActiveRecord::Base
  has_many :essays
  has_many :posts

  has_many :favs
  has_many :mylists
end
