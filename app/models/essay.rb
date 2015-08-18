class Essay < ActiveRecord::Base
  belongs_to :user
  has_many :image_eassys
  has_many :mylists

  def essay_create(user,params)
    essay = Essay.new()
    essay.text = params[:text];
    essay.title = params[:title]
    essay.pickup_f = params[:flag]
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

  
end
