class CreateImageEssays < ActiveRecord::Migration
  def change
    create_table :image_essays do |t|
      t.integer :essay_id
      t.binary :image
      t.timestamps null: false
    end
  end
end
