namespace :db do
  task populate: :environment do
    fname = Rails.root.join("lib/tasks", "image1.jpg")
    UserImage.create!(
      user: User.create!(
          name: "test_admin",
          password: "testpass",
          password_confirmation: "testpass",
          crypted_password: "400$8$21$c11ef87b15b3055a$6f8d0135427cf918c5baf4e9d205d0a7bdc822f43eb849b057a55227a7f524cc",
          password_salt: "dSqxx3bt3jAO0F9Cxn69",
          persistence_token: "1328e11d20e96eeb68a11f5e8a666f178e4dacd41dfa3b8916073b35e50dc4da18f28c34ecf0e1c81630725267187a7cd37f6d6aa6dc26e75116420fb356fffb",
          admin: "true",
          gender: "0",
          business: "0"
        ),
      data: File.open(fname, "rb").read,
      content_type: "image/jpeg"
    )
    UserImage.create!(
      user: User.create!(
        name: "test",
        password: "testpass",
        password_confirmation: "testpass",
        crypted_password: "400$8$3c$bf5720ce5f409eea$a4aa5b11036eac8090defb386b6ec4d9caad058e1b2b30278dac829d4b74feb5",
        password_salt: "yiTOVEo20UGYyl3rzdy2",
        persistence_token: "6a933888cd3f49a1fb420e5669635b1b5657048bee589e94cd708b349829d8be5b614e1d171a7810a3c2530b9ac42bd75d1e08c99e67c8549ed178a1fb597e08",
        admin: "false",
        gender: "0",
        business: "0"
        ),
      data: File.open(fname, "rb").read,
      content_type: "image/jpeg"
    )
    UserImage.create!(
      user: User.create!(
        name: "yamapro",
        password: "yamasita",
        password_confirmation: "yamasita",
        admin: "true",
        gender: "0",
        business: "0"
        ),
      data: File.open(fname, "rb").read,
      content_type: "image/jpeg"
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
    Essay.create!( #3つ目特集
      text: "働いてくれている親に感謝しよう！！\n
      勤労感謝の日も近いので、日頃家族のために働いてくれているお父さんやお母さんに感謝を伝えてはいかがで？
      勤労感謝の日とは
      勤労感謝の日は、1948年に「勤労を尊び、生産を祝い、国民互いに感謝しあう」という精神のもとに制定され、現在では一般的に「働いている人にありがとうを伝える日」として定着しています。
      今回は日頃、家族のために働いてくれているお父さんやお母さんに感謝を込めたプレゼントを紹介します。
      日頃の感謝をこめてプレゼントを渡そう
      感謝の気持ちをカタチとして表しやすいものはプレゼントです。今回は、勤労感謝の日ですから普段、お仕事等で使用するものなどが良いでしょう。特に身に着けていくものは、身近に感じられて良いですね。例えば、ハンカチや靴、バッグ。お父さんならネクタイ、お母さんならアクセサリーといったものがあります。親子で一緒に選んだり、それとなく親に聞いてみることも親子のふれあいの時間が作れるので考えてみるのはいかがですか。
      あくまで「感謝を伝える」
      始めに書いたように勤労感謝の日はプレゼントを渡すことや親の苦労を知ることが目的ではありません。感謝を伝えることが目的です。ですから、これだけではなく、必ず感謝を伝えることが大切です。伝え方は、プレゼントを渡す時に直接言うのも良し。一言メッセージを添えるのも良し。直接伝えられない方は、電話やメールで伝えるだけでも十分です。少し照れくさいですが手紙をプレゼントとして渡すとあなたの気持ちが伝わるのではないでしょうか。
      次から「実家暮らし」「一人暮らし」の環境別に、おすすめの親孝行の方法を紹介します！

      勤労感謝の日〜〜実家暮らしの親孝行〜〜

      実家暮らしの人は普段から親にあっているので親が働いているありがたみに気づいてはいるのですが、なかなか感謝が言い出せない、という人も多いと思います。
      そこで「勤労感謝の日」をきっかけにでいつも働いてくれている両親に感謝を伝えましょう！！
　     いつも家族を支えてくれている親の代わりまたは親のために、自分ができることは何でしょうか。掃除や料理、洗濯といった家事やおつかい、頼まれごとなどでも快く引き受けてみてください。いつも親が感じている苦労を感じて、支えてくれているありがたみを感じることで、より一層の感謝を感じると思います。

    ・プレゼント編
    〜普段渡せるものではなく、「勤労感謝の日」を意識したものをあげよう〜

    ーネクタイ、ハンカチ、など仕事場で身につけているもの
    　ネクタイ、ハンカチは毎日身につけるものなので、いくつあっても困らないものです。
    　それが子供からのプレゼントとなれば喜んで身につけてくれること間違いナシ。

    ーボールペンなどの消耗品
    　昨今の日本は物に対して高級志向で、ボールペンなどの消耗品でも昔とは違って高級なものが売られています。消耗品ではありますが、仕事でたくさんの人から見られるものだからこそ、プレゼントで少しこだわった物を渡すのはどうでしょうか？

    ー包丁などの調理器具
    　料理は、食品を切ったり、かき混ぜたりと意外と体力のいる作業です。そして、料理で使っている調理器具というのは包丁の切れ味が悪くなったり、洗うのに時間がかかったり、と何年も使っているといろんな問題が出てきます。それでもちゃんとやってくれているお母さん（お父さん）の作業が捗るように新しく買い直すというのはいかがでしょうか？
    　
    ー掃除機などの家電製品
    　掃除、洗濯など、家事に使用する家電製品は毎年毎年、新機能を追加して市場に出てきます。最近では布団用掃除機や、自動掃除機など用途別でさまざまな家電製品が売り出されています。
    家電製品は予算的に手を出せないというものも多いですが、親が貰えばうれしい、自分が使ってみても楽しい物ばかりです。今流行りのものをプレゼントして、親をアッと驚かせませんか？


    ・伝える編
    〜やってもらっていることを今一度感謝しよう〜

    ー置き手紙
    　置き手紙は、直接会って親に面と向かって話す、というのは恥ずかしい。だけど、LINEや電話よりも特別感を出したい、という人向けです。親の反応が直接的にはわからないので、普段言えなかった素直な気持ちを親に伝えることができます。

    ーご飯などに誘って直接言う
    　親に直接感謝を伝えるというのは恥ずかしいし、なかなかできることではありません。親にとにかく感謝を伝えたい、親の反応を見たい、という人に向いています。いつも生活している家だとなかなかそんな雰囲気にならないので言いにくい。ですが、外食に誘えばいつもと違った環境という特別感、また、BGMなどのムードがお互いの心の準備をさせてくれるので言いやすくなると思います。


    勤労感謝の日〜〜一人暮らしの親孝行〜〜

    　一人暮らしの人は、普段両親がいない生活をしています。両親と同居していないため日々が忙しい中家事をし、バイトをしてお金を稼ぐ大変な生活をおくっていると思います。そのため両親がいることのありがたみや日々の両親の苦労を知ることができたのではないでしょうか。
    　その気持ちを「勤労感謝の日」に伝えてみませんか？ということで、ここでは一人暮らしをしているみなさん向けの親孝行を紹介していきます。

    ・プレゼント編
    〜感謝の気持ちが伝わりやすいものを贈ろう〜

    ー花
    　花の一つ一つには花言葉があり、両親に気持ちを伝えるには打って付けのプレゼントとなります。小物などをプレゼントするためには両親に欲しい物の要望を聞く必要があります。しかし花をプレゼントする場合はそれがいらないので、サプライズ度が上がるでしょう。
    　具体的には、花を感謝のメッセージと共に贈ると自分の想いも伝えることができます。花言葉で「感謝」という意味合いを持つ赤い薔薇等をプレゼントすると喜ばれると思われます。また、水分を抜き、長時間きれいな色彩で保たれるプリザーブドフラワーといったものも良いでしょう。
    　花をプレゼントしたことない人は一度試してみてはいかがでしょうか？

    ー手紙
    　近年、携帯電話(スマートフォン)の普及により多くの人が遠くにいる人でも連絡を取ることができる時代となっています。そんな時代だからこそ手書きで心のこもった手紙を書き、両親に今まで育ててくれたことへの感謝や自分の考えや気持ちを伝えてみましょう。

    ・連絡編
    〜電話で長話をしよう〜
    　一人暮らしに慣れてきて、両親と連絡することが少なくなっていませんか？
    　連絡がなくとも心配している親は多く、「今息子・娘はどんな生活をしているのだろうか？」と思っているはずです。そこで今回の勤労感謝の日にメールやLINEではなく、電話をして声を聞かせて、親と大学生活についてや家での暮らしなどの話をすると良いでしょう。

    ・帰省編
    〜今年の連休は実家に帰って家族と過ごそう〜
    　今年の勤労感謝の日は11月23日(月)にあり、土日も合わせると3連休になります。日帰りできない人も、今年なら帰省することができると思います。帰省したらゆっくり家で過ごし、会話を楽しむのも良し、一緒に出かけるのも良し、3連休を自由に家族と過ごしてみたらいかがですか？
    　両親はあなたの顔を見ると安心するでしょうし、あなたも普段会っていない両親の顔を見たら色んな感情が出てくるかもしれません。ぜひ一人暮らしの皆さんは、帰省することをお勧めします。
    これらの例を参考にして働いてくれている親に感謝の気持ちを伝えてみませんか？
    勿論、欲しい物をプレゼントすることも自分がしてあげたいことを行うことも全く問題ありません。むしろ、そちらの方が喜ばれる家庭もあると思います。要は、感謝の気持ちを表すことが重要なのです。

    豆知識
    　「労う」という意味の込められた言葉を使用することは控えると良いでしょう。「労う」とは本来、自分から見て目下か同等の立場の者に対して使われる言葉です。家族間のことではありますが、今回はこちらが働いている方に対して感謝をする立場であるため、このような意味の言葉の使用は勧められません。とはいえ、「いつもお疲れ様。ありがとう。」と一言添えるぐらいなら気にしなくてもいいでしょう。",
      user_id: "2",
      title: "勤労感謝の日特集",
      pickup_f: "true"
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
    # Fav.create!(
    #   user_id: "1",
    #   post_id: "1"
    # )
    # Fav.create!(
    #   user_id: "1",
    #   post_id: "1"
    # )
    Mylist.create!(
      user_id: "1",
      essay_id: "1"
    )
    Mylist.create!(
      user_id: "1",
      essay_id: "2"
    )
    Mylist.create!( #特集
      user_id: "1",
      essay_id: "3"
    )
    piety_tag_names = ['質問','旅行','プレゼント','手伝い','食事','ショッピング','趣味','帰省','外出','報告','運動','料理','サプライズ', 'その他']
    piety_tag_names.each do |tag|
      Tag.create!(
        name: tag
      )
    end
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
