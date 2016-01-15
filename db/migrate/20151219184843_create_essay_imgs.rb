class CreateEssayImgs < ActiveRecord::Migration
  def change
    create_table :essay_imgs do |t|
      t.binary :data
      t.text :name

      t.timestamps null: false
    end
  end
end
