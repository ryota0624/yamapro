class Essay < ActiveRecord::Base
  belongs_to :user
  has_many :image_eassys, :dependent => :destroy
  has_many :mylists , :dependent => :destroy
  has_many :tag_essays , :dependent => :destroy
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

  def Essay.title_search(keyword)
    keyword = "%"+ keyword +"%"
    result = {
      pickup: nil,
      user_posts: nil
    }
    essays = Essay.where(["title LIKE ?",keyword])
    result[:pickup] = essays.where(pickup_f: true)
    result[:user_posts] = essays.where(pickup_f: false)
    result
  end

  def Essay.keyword_search(keyword)
    keyword = "%"+ keyword +"%"
    result = {
      pickup: nil,
      user_posts: nil
    }
    essays = Essay.where(["text LIKE ?",keyword])
    result[:pickup] = essays.where(pickup_f: true)
    result[:user_posts] = essays.where(pickup_f: false)
    result
  end
  
   def Essay.sugest_essays(current_user)
    rankerEssay = Proc.new {
      if current_user.blank? 
        mylist = Mylist.group(:essay_id).count().to_a.sort {|a, b| -(a[1].to_i <=> b[1].to_i)}
        mylist.map { |essay_id|
          Essay.find_by id: essay_id[0]
        }.compact
      else
        Essay.where(question: true).limit 4
      end
    }
    if current_user.nil? then
      return rankerEssay.call
    end
    
    tag = current_user.tag_users.first
    if tag then
	   	userInfo = Usertag.find(tag.id)
	    parentsTags = Tag.where(name: userInfo.fage)
	    Essay.sugest_parent(parentsTags.first).concat Essay.sugest_parent parentsTags.last
    else
      rankerEssay.call
    end
  end

  def Essay.sugest_parent(parent) 
    if parent.nil? then
      return []
    end
    parent.tag_essays.map {|tag|
      Essay.find_by(id: tag.essay_id)
	 }.compact
  end
end
