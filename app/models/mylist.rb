class Mylist < ActiveRecord::Base
  belongs_to :user
  belongs_to :essay
end
