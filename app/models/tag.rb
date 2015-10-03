class Tag < ActiveRecord::Base
  has_many :tag_essays
  def Tag.seaching_essays(tag_id)
    tag = Tag.find(tag_id)
    result = tag.tag_essays.map { |tag_essay| tag_essay.essay }
  end
end
