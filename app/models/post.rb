class Post < ActiveRecord::Base
  belongs_to :user

  def create_post(user,text)
    post = Post.new()
    post.user_id = user.id
    post.content = text
    post.save()
  end
end
