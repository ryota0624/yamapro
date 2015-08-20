namespace :db do
  task populate: :environment do
        User.create!(
           name: "test",
           password: "testpass",
           password_confirmation: "testpass",
           admin: "false",
           gender: "0",
           data: "test",
           content_type: "test"
           )
    end
end