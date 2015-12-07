namespace :db do
  task tag_reset: :environment do
    Tag.destroy_all
        tag_names = ['父','母','プレゼント','趣味','手伝い','帰省','旅行','料理','誕生日','勤労感謝の日','正月','クリスマス','父の日','母の日','サプライズ']
    tag_names.each do |tag|
      Tag.create!(
        name: tag
      )
    end
  end
end