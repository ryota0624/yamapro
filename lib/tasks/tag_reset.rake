namespace :db do
  task tag_reset: :environment do
    Tag.destroy_all
        tag_names = ['手伝い','食事','ショッピング','趣味','帰省','外出','報告','運動','料理','サプライズ', 'その他']
    tag_names.each do |tag|
      Tag.create!(
        name: tag
      )
    end
  end
end
