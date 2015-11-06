class TagUser < ActiveRecord::Base
  belongs_to :usertag
  belongs_to :user
end
