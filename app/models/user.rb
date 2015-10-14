class User < ActiveRecord::Base

  # for authlogic
  acts_as_authentic do |c|
    c.login_field = :name
  end
  has_many :essays
  has_many :posts
  has_many :favs
  has_many :mylists

  # attr_accessor :uploaded_image

  def add_mylist(essay_id)
    item = Mylist.new()
    item.user_id = self.id
    item.essay_id = essay_id
    item.save()
  end

  def fav_post(post_id)
    fav = Fav.new()
    fav.post_id = post_id
    fav.user_id = self.id
    fav.save;
  end

  IMAGE_TYPES = { "image/jpeg" => "jpg", "image/gif" => "gif",
                  "image/png" => "png" }

  def extension
    IMAGE_TYPES[content_type]
  end

  def uploaded_image=(image)
    self.content_type = convert_content_type(image.content_type)
    self.data = image.read
    @uploaded_image = image
  end

  private
    def convert_content_type(ctype)
      ctype = ctype.rstrip.downcase
      case ctype
      when "image/pjpeg" then "image/jpeg"
      when "image/jpg"   then "image/jpeg"
      when "image/x-png" then "image/png"
      else ctype
      end
    end


end
