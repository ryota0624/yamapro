class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string    :name,              null: false
      t.string    :crypted_password,  null: false
      t.string    :password_salt,     null: false
      t.string    :persistence_token, null: false
      t.boolean   :admin,             null: false, default: false
      t.integer   :gender,            null: false #0=男 1=女
      t.integer   :business,          null: false #0=学生/専門学生, 1=社会人, 2=その他
      t.timestamps                    null: false
    end

    add_index :users, :name, unique: true

  end
end
