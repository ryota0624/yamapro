class CreateTagEssays < ActiveRecord::Migration
  def change
    create_table :tag_essays do |t|
      t.integer :tag_id
      t.integer :essay_id
      t.timestamps null: false
    end
  end
end
