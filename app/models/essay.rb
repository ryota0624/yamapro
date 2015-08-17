class Essay < ActiveRecord::Base
  belongs_to :user
  has_many :image_eassys
  has_many :mylists
end
