class UserImage < ActiveRecord::Base
  belongs_to :user

  attr_accessor :uploaded_image

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
