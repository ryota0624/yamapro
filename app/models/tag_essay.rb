class TagEssay < ActiveRecord::Base
  belongs_to :tag
  belongs_to :essay
  # tag_id と essay_idの組み合わせがユニークになるように

end
