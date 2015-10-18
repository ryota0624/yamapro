class Essay < ActiveRecord::Base
  belongs_to :user
  has_many :image_eassys
  has_many :mylists
  has_many :tag_essays
  default_scope {order("updated_at desc")}

  def Essay.essay_create(user,params)
    essay = Essay.new()
    essay.text = params[:text]
    essay.title = params[:title]
    essay.pickup_f = params[:pickup_f]
    essay.user_id = user.id
    esssay.save()#返り値はtrue/false
    #essay 返り値をオブジェクトにしたい場合
  end

  def essay_comment(user,text)
    comment = Comment.new()
    comment.user_id = user.id
    comment.essay_id = self.id
    comment.text = text
    comment.save()
  end

  def add_image(image_id)
    image = Image.new()
    image.image_id = image_id
    image.essay_id = self.id
    image.save()
  end

  def add_tag(tags)
    tags.each do |tag_id|
      puts tag_id
      tag_essay = TagEssay.new()
      tag_essay.tag_id = tag_id
      tag_essay.essay_id = self.id
      tag_essay.save()
    end
  end

  def Essay.keyword_search(keyword)
    keyword = "%"+ keyword +"%"
    result = {
      pickup: nil,
      user_posts: nil
    }
    essays = Essay.where(["text LIKE ?",keyword])
    result[:pickup] = essays.where("pickup_f = true")
    result[:user_posts] = essays.where("pickup_f = false")
    result
  end
end
