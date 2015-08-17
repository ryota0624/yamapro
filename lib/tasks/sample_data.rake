namespace :db do
  task populate: :environment do
    User.create!(
                 name: "test",
                 crypted_password: "testpass",
                 password_salt: "testpass",
                 persistence_token: "testpass",
                 admin: "false",
                 gender: "0",
                 data: "test",
                 content_type: "test"
                 )
  User.create!(
                 name: "test_admin",
                 crypted_password: "testpass",
                 password_salt: "testpass",
                 persistence_token: "testpass",
                 admin: "true",
                 gender: "0",
                 data: "test",
                 content_type: "test"
                 )
  end
end