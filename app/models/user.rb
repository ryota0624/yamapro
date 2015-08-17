class User < ActiveRecord::Base
  has_many :essays
  has_many :posts
end
