class Post < ActiveRecord::Base
  belongs_to :user

  def Post.create_post(text,user)
    post = Post.new()
    post.user_id = user.id
    post.content = text
    post.save()
  end
end
