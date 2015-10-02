class TagEssay < ActiveRecord::Base
  belongs_to :tag
  belongs_to :essay
end
