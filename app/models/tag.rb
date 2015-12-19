class Tag < ActiveRecord::Base
  has_many :tag_essays , :dependent => :destroy
  def Tag.seaching_essays(tag_id)
    tag = Tag.find(tag_id)
    result = tag.tag_essays.map { |tag_essay| tag_essay.essay }
  end
	
	def get_essays
		self.tag_essays.map do |essay|
			Essay.find_by(id: essay.essay_id)
		end
	end
end
