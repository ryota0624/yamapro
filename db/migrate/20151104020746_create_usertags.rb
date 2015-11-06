class CreateUsertags < ActiveRecord::Migration
  def change
    create_table :usertags do |t|
      t.string "fage" #父の年代
      t.string "mage" #母の年代
      t.string "place" #住んでいる場所 

      t.timestamps null: false
    end
  end
end
