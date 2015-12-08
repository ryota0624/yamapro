class Usertag < ActiveRecord::Base
  has_many :tag_users , :dependent => :destroy
end
