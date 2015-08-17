class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string    :name,              null: false
      t.string    :crypted_password,  null: false
      t.string    :password_salt,     null: false
      t.string    :persistence_token, null: false
      t.boolean   :admin,             null: false, default: false
      t.integer   :gender,            null: false #0=男 1=女
      t.binary    :data
      t.string    :content_type
      t.timestamps                    null: false
    end
  end
end
