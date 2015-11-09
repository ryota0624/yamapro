class CreateTagUsers < ActiveRecord::Migration
  def change
    create_table :tag_users do |t|
      t.integer "tag_id"
      t.integer "user_id"
      t.timestamps null: false
    end
  end
end
