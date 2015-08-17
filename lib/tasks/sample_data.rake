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
        Essay.create!(
            text: "sample text",
            user_id: "1",
            title: "sample title",
            pickup_f: "false"
            )
        Essay.create!(
            text: "sample text2",
            user_id: "1",
            title: "sample title2",
            pickup_f: "false"
            )
        Post.create!(
            content: "sample post",
            user_id: "1"
            )
    end
end