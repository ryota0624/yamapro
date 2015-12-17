class CreateEssays < ActiveRecord::Migration
  def change
    create_table :essays do |t|
      t.string :text
      t.integer :user_id
      t.string :title
      t.boolean :pickup_f
      t.timestamps null: false
    end
  end
end
