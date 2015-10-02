namespace :db do
  task populate: :environment do
    User.create!(
      name: "test_admin",
      password: "testpass",
      password_confirmation: "testpass", 
      crypted_password: "400$8$21$c11ef87b15b3055a$6f8d0135427cf918c5baf4e9d205d0a7bdc822f43eb849b057a55227a7f524cc",
      password_salt: "dSqxx3bt3jAO0F9Cxn69",
      persistence_token: "1328e11d20e96eeb68a11f5e8a666f178e4dacd41dfa3b8916073b35e50dc4da18f28c34ecf0e1c81630725267187a7cd37f6d6aa6dc26e75116420fb356fffb",
      admin: "true",
      gender: "0",
      data: "test",
      content_type: "test"
    )
    User.create!(
      name: "test",
      password: "testpass",
      password_confirmation: "testpass", 
      crypted_password: "400$8$3c$bf5720ce5f409eea$a4aa5b11036eac8090defb386b6ec4d9caad058e1b2b30278dac829d4b74feb5",
      password_salt: "yiTOVEo20UGYyl3rzdy2",
      persistence_token: "6a933888cd3f49a1fb420e5669635b1b5657048bee589e94cd708b349829d8be5b614e1d171a7810a3c2530b9ac42bd75d1e08c99e67c8549ed178a1fb597e08",
      admin: "false",
      gender: "0",
      data: "test",
      content_type: "test"
    )
    Essay.create!(
      text: "sample text",
      user_id: "1",
      title: "sample title",
      pickup_f: "false,"
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
    Post.create!(
      content: "sample post2",
      user_id: "1"
    )
    Comment.create!(
      essay_id: "1",
      user_id: "1",
      text: "commmmment"
    )
    Comment.create!(
      essay_id: "1",
      user_id: "1",
      text: "commmmment2"
    )
    Fav.create!(
      user_id: "1",
      post_id: "1"
    )
    Fav.create!(
      user_id: "1",
      post_id: "1"
    )
    Mylist.create!(
      user_id: "1",
      essay_id: "1"
    )
    Mylist.create!(
      user_id: "2",
      essay_id: "1"
    )
    Tag.create!(
      name: "father"
    )
    Tag.create!(
      name: "mother"
    )
    Tag.create!(
      name: "present"
    )
  end
end