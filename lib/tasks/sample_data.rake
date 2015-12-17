namespace :db do
  task populate: :environment do
    fname = Rails.root.join("lib/tasks", "image1.jpg")
    UserImage.create!(
      user: User.create!(
        name: "yamapro",
        password: "ympappadmin",
        password_confirmation: "ympappadmin",
        admin: "true",
        gender: "0",
        business: "0"
        ),
      data: File.open(fname, "rb").read,
      content_type: "image/jpeg"
    )
    piety_tag_names = ['質問','旅行','プレゼント','手伝い','食事','ショッピング','趣味','帰省','外出','報告','運動','料理','サプライズ', 'その他']
    piety_tag_names.each do |tag|
      Tag.create!(
        name: tag
      )
    end
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
    Essay.create!(
      text: "sample text",
      user_id: "1",
      title: "sample title",
      pickup_f: "true"
    )
    Essay.create!(
      text: "sample text2",
      user_id: "1",
      title: "sample title2",
      pickup_f: "true"
    )   
    event_tag_names = ["父の日", "母の日", "誕生日", "結婚記念日", "祭日", "Xmas", "正月", "お盆", "連休", "休日", "平日"]
    event_tag_names.each do |tag|
      Tag.create!(
        name: tag
      )
    end
    season_tag_names = ["春", "夏", "秋", "冬"]
    season_tag_names.each do |tag|
      Tag.create!(
        name: tag
      )
    end
    spot_tag_names = ["自宅", "自宅外"]
    spot_tag_names.each do |tag|
      Tag.create!(
        name: tag
      )
    end
    budget_tag_names = ["0円", "~2,000円","~5,000円","~10,000円","~30,000円","30,000円~"]
    budget_tag_names.each do |tag|
      Tag.create!(
        name: tag
      )
    end
    fage_tag_names = ["30代", "40代", "50代", "60代", "70代以上"]
    fage_tag_names.each do |tag|
      Tag.create!(
        name: tag
      )
    end
    mage_tag_names = ["30代", "40代", "50代", "60代", "70代以上"]
    mage_tag_names.each do |tag|
      Tag.create!(
        name: tag
      )
    end
    business_tag_names = ["学生/専門学生" , "社会人", "その他"]
    business_tag_names.each do |tag|
      Tag.create!(
        name: tag
      )
    end
    place_tag_names = ["実家暮らし", "一人暮らし", "下宿"]
    place_tag_names.each do |tag|
      Tag.create!(
        name: tag
      )
    end

    Usertag.create!(
      fage: "40代",
      mage: "40代",
      place: "一人暮らし"
    )
    TagUser.create!(
      tag_id: "1",
      user_id: "1"
    )
  end
end
