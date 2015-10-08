class AddContentTypeToImageEssays < ActiveRecord::Migration
  def change
    add_column :image_essays, :Content_type, :string
  end
end
