class AddImageNameToImageEssays < ActiveRecord::Migration
  def change
    add_column :image_essays, :img_name, :string
  end
end
