class CreateImgs < ActiveRecord::Migration
  def change
    create_table :imgs do |t|
      t.binary :data
      t.text :name

      t.timestamps null: false
    end
  end
end
