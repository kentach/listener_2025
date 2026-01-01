puts "🔧 Fixing PostgreSQL sequences..."

ActiveRecord::Base.transaction do
  # 既存のVocabularyを削除
  Vocabulary.delete_all

  # -------------------------------
  # 疑問詞
  # -------------------------------
  wh_questions = [
    { number: 1, english: "what", japanese: "何" },
    { number: 2, english: "what color",  japanese: "何色" },
    { number: 3, english: "what sports",  japanese: "何のスポーツ" },
    { number: 4, english: "what food",  japanese: "何の食べ物" },
    { number: 5, english: "what drink",  japanese: "何の飲み物" },
    { number: 6, english: "what animals",  japanese: "何の動物" },
    { number: 7, english: "what subject",  japanese: "何の教科" },
    { number: 8, english: "what time",  japanese: "何時" },
    { number: 9, english: "What day (of the week) is it today?", japanese: "今日は何曜日？" },
    { number: 10, english: "What’s the date today?",  japanese: "今日の日付は？" },
    { number: 11, english: "What’s your favorite  ?",  japanese: "あなたの好きな〇〇は？" },
    { number: 12, english: "Where",  japanese: "どこ" },
    { number: 13, english: "When",  japanese: "いつ" },
    { number: 14, english: "Who",  japanese: "誰" },
    { number: 15, english: "Whose",  japanese: "誰の" },
    { number: 16, english: "Which",  japanese: "どの" },
    { number: 17, english: "How",  japanese: "どうやって" },
    { number: 18, english: "How do you go to ?",  japanese: "どうやって～へ行きますか？" },
    { number: 19, english: "How do you get to ?",  japanese: "どうやって～へ行きますか？" },
    { number: 20, english: "How are you?",  japanese: "元気ですか？" },
    { number: 21, english: "How old",  japanese: "何才" },
    { number: 22, english: "How much",  japanese: "いくら（値段、量）" },
    { number: 23, english: "How many",  japanese: "いくつ（数）" },
    { number: 24, english: "How about ?",  japanese: "～はどうですか？" },
    { number: 25, english: "How tall",  japanese: "どのくらいの高さ" },
    { number: 26, english: "How long",  japanese: "どのくらい（時間、期間、長さ）" }
  ]

  wh_questions.each do |q|
    Vocabulary.create!(
      number: q[:number],
      english: q[:english],
      japanese: q[:japanese],
      series: "疑問詞",
      level: "5級"
    )
  end

  # -------------------------------
  # 動詞シリーズ
  # -------------------------------
  verbs1 = [
    { number: 1, english: "like", japanese: "好き" },
    { number: 2, english: "play", japanese: "～する（スポーツ、楽器）" },
    { number: 3, english: "play soccer", japanese: "サッカーをする" },
    { number: 4, english: "play basketball", japanese: "バスケットボールをする" },
    { number: 5, english: "play baseball", japanese: "野球をする" },
    { number: 6, english: "play volleyball", japanese: "バレーボールをする" },
    { number: 7, english: "play tennis", japanese: "テニスをする" },
    { number: 8, english: "play badminton", japanese: "バドミントンをする" },
    { number: 9, english: "play video games", japanese: "テレビゲームをする" },
    { number: 10, english: "play the piano", japanese: "ピアノを弾く" },
    { number: 11, english: "play the guitar", japanese: "ギターを弾く" },
    { number: 12, english: "study", japanese: "勉強する" },
    { number: 13, english: "study English", japanese: "英語を勉強する" },
    { number: 14, english: "study Japanese", japanese: "日本語（国語）を勉強する" },
    { number: 15, english: "study math", japanese: "算数（数学）を勉強する" },
    { number: 16, english: "study music", japanese: "音楽を勉強する" },
    { number: 17, english: "study science", japanese: "理科を勉強する" },
    { number: 18, english: "study social studies", japanese: "社会を勉強する" },
    { number: 19, english: "study history", japanese: "歴史を勉強する" },
    { number: 20, english: "eat", japanese: "食べる" },
    { number: 21, english: "eat breakfast", japanese: "朝食を食べる" },
    { number: 22, english: "eat lunch", japanese: "昼食を食べる" },
    { number: 23, english: "eat dinner", japanese: "夕食を食べる" },
    { number: 24, english: "drink", japanese: "飲む" },
    { number: 25, english: "sleep", japanese: "寝る" },
    { number: 26, english: "cook", japanese: "料理する" },
    { number: 27, english: "go to ～", japanese: "～へ行く" },
    { number: 28, english: "go to bed", japanese: "寝る" },
    { number: 29, english: "go shopping", japanese: "買い物に行く" },
    { number: 30, english: "go skiing", japanese: "スキーに行く" },
    { number: 31, english: "go fishing", japanese: "釣りをする" },
    { number: 32, english: "go swimming", japanese: "泳ぐ" },
    { number: 33, english: "go hiking", japanese: "ハイキングをする" },
    { number: 34, english: "go to the movies", japanese: "映画館へ行く" },
    { number: 35, english: "get to ～", japanese: "～へ行く、～着く" },
    { number: 36, english: "get up", japanese: "起きる" },
    { number: 37, english: "wake up", japanese: "目覚める" },
    { number: 38, english: "live in ～", japanese: "～に住む" },
    { number: 39, english: "listen to ～", japanese: "～を聞く" },
    { number: 40, english: "look at ～", japanese: "～を見る（止まっている物）" },
    { number: 41, english: "watch", japanese: "見る（動いている物）" },
    { number: 42, english: "watch TV", japanese: "テレビを見る" },
    { number: 43, english: "see", japanese: "見る" },
    { number: 44, english: "wash", japanese: "洗う" },
    { number: 45, english: "wash the dishes", japanese: "皿を洗う" },
    { number: 46, english: "want", japanese: "欲しい" },
    { number: 47, english: "make", japanese: "作る" },
    { number: 48, english: "make cookies", japanese: "クッキーを作る" },
    { number: 49, english: "speak", japanese: "話す" },
    { number: 50, english: "speak English", japanese: "英語を話す" },
    { number: 51, english: "speak Japanese", japanese: "日本語を話す" },
    { number: 52, english: "speak French", japanese: "フランス語を話す" },
    { number: 53, english: "speak Chinese", japanese: "中国語を話す" },
    { number: 54, english: "sit down", japanese: "座る" },
    { number: 55, english: "stand up", japanese: "立つ" },
    { number: 56, english: "write", japanese: "書く" }
  ]

  verbs1.each do |v|
    Vocabulary.create!(
      number: v[:number],
      english: v[:english],
      japanese: v[:japanese],
      series: "動詞シリーズ1",
      level: "5級"
    )
  end

  verbs2 = [
{ number: 57, english: "write a letter", japanese: "手紙を書く" },
{ number: 58, english: "clean", japanese: "掃除する" },
{ number: 59, english: "teach", japanese: "教える" },
{ number: 60, english: "meet", japanese: "会う" },
{ number: 61, english: "enjoy", japanese: "楽しむ" },
{ number: 62, english: "help", japanese: "助ける、手伝う" },
{ number: 63, english: "stop", japanese: "止まる、やめる" },
{ number: 64, english: "start", japanese: "始める、始まる" },
{ number: 65, english: "begin", japanese: "始める、始まる" },
{ number: 66, english: "cut", japanese: "着る" },
{ number: 67, english: "run", japanese: "走る" },
{ number: 68, english: "buy", japanese: "買う" },
{ number: 69, english: "sell", japanese: "売る" },
{ number: 70, english: "know", japanese: "知っている" },
{ number: 71, english: "swim", japanese: "泳ぐ" },
{ number: 72, english: "walk", japanese: "歩く" },
{ number: 73, english: "sing", japanese: "歌う" },
{ number: 74, english: "sing a song", japanese: "歌を歌う" },
{ number: 75, english: "do", japanese: "する" },
{ number: 76, english: "do my homework", japanese: "宿題をする" },
{ number: 77, english: "have", japanese: "持っている、いる、ある" },
{ number: 78, english: "read", japanese: "読む" },
{ number: 79, english: "read a book", japanese: "本を読む" },
{ number: 80, english: "read a newspaper", japanese: "新聞を読む" },
{ number: 81, english: "come", japanese: "来る" },
{ number: 82, english: "come in", japanese: "入って来る" },
{ number: 83, english: "come home", japanese: "家に来る" },
{ number: 84, english: "come here", japanese: "ここに来る" },
{ number: 85, english: "open", japanese: "開ける" },
{ number: 86, english: "open the window", japanese: "窓を開ける" },
{ number: 87, english: "close", japanese: "閉める" },
{ number: 88, english: "close the door", japanese: "ドアを閉める" },
{ number: 89, english: "shut", japanese: "閉める" },
{ number: 90, english: "carry", japanese: "運ぶ" },
{ number: 91, english: "use", japanese: "使う" },
{ number: 92, english: "use a computer", japanese: "コンピューターを使う" },
{ number: 93, english: "work", japanese: "働く" },
{ number: 94, english: "pass", japanese: "取る、渡す" },
{ number: 95, english: "Pass me ～.", japanese: "～を取ってください" }
  ]

    verbs2.each do |v|
      Vocabulary.create!(
        number: v[:number],
        english: v[:english],
        japanese: v[:japanese],
        series: "動詞シリーズ2",
        level: "5級"
      )
  end

  hours = [
  { number: 1, english: "time", japanese: "時間" },
  { number: 2, english: "minute", japanese: "分" },
  { number: 3, english: "hour", japanese: "時間" },
  { number: 4, english: "day", japanese: "日" },
  { number: 5, english: "week", japanese: "週" },
  { number: 6, english: "month", japanese: "月" },
  { number: 7, english: "year", japanese: "年" },
  { number: 8, english: "today", japanese: "今日" },
  { number: 9, english: "weekend", japanese: "週末" },
  { number: 10, english: "morning", japanese: "朝、午前中" },
  { number: 11, english: "afternoon", japanese: "午後" },
  { number: 12, english: "evening", japanese: "晩" },
  { number: 13, english: "night", japanese: "夜" },
  { number: 14, english: "midnight", japanese: "深夜" },
]
  hours.each do |v|
  Vocabulary.create!(
    number: v[:number],
    english: v[:english],
    japanese: v[:japanese],
    series: "時間",
    level: "5級"
  ) 
  end

  # db/seeds.rb

places = [
  { number: 1, english: "place", japanese: "場所" },
  { number: 2, english: "station", japanese: "駅" },
  { number: 3, english: "post office", japanese: "郵便局" },
  { number: 4, english: "restaurant", japanese: "レストラン" },
  { number: 5, english: "supermarket", japanese: "スーパー" },
  { number: 6, english: "shop", japanese: "店" },
  { number: 7, english: "bank", japanese: "銀行" },
  { number: 8, english: "library", japanese: "図書館" },
  { number: 9, english: "park", japanese: "公園" },
  { number: 10, english: "pool", japanese: "プール" },
  { number: 11, english: "hotel", japanese: "ホテル" },
  { number: 12, english: "hospital", japanese: "病院" },
  { number: 13, english: "bus stop", japanese: "バス停留所" },
  { number: 14, english: "movie theater", japanese: "映画館" },
  { number: 15, english: "airport", japanese: "空港" },
  { number: 16, english: "cafeteria", japanese: "食堂" },
  { number: 17, english: "department store", japanese: "デパート" },
  { number: 18, english: "city", japanese: "市" },
  { number: 19, english: "town", japanese: "町" },
  { number: 20, english: "mountain", japanese: "山" },
  { number: 21, english: "river", japanese: "川" },
  { number: 22, english: "lake", japanese: "湖" },
  { number: 23, english: "sea", japanese: "海" },
  { number: 24, english: "beach", japanese: "海辺" }
]

places.each do |v|
  Vocabulary.create!(
    number: v[:number],
    english: v[:english],
    japanese: v[:japanese],
    series: "場所",
    level: "5級"
  )
end

# 天気
weather = [
  { number: 1, english: "fine", japanese: "晴れ/元気" },
  { number: 2, english: "sunny", japanese: "晴れ" },
  { number: 3, english: "cloudy", japanese: "くもりの" },
  { number: 4, english: "rainy", japanese: "雨がふっている" },
  { number: 5, english: "snowy", japanese: "雪がふっている" },
  { number: 6, english: "windy", japanese: "風が強い" }
]

weather.each do |v|
  Vocabulary.create!(
    number: v[:number],
    english: v[:english],
    japanese: v[:japanese],
    series: "天気",
    level: "5級"
  )
end

sports = [
  { number: 1, english: "sport", japanese: "スポーツ" },
  { number: 2, english: "baseball", japanese: "野球" },
  { number: 3, english: "soccer", japanese: "サッカー" },
  { number: 4, english: "tennis", japanese: "テニス" },
  { number: 5, english: "basketball", japanese: "バスケットボール" },
  { number: 6, english: "volleyball", japanese: "バレーボール" },
  { number: 7, english: "table tennis", japanese: "卓球" },
  { number: 8, english: "golf", japanese: "ゴルフ" }
]

sports.each do |v|
  Vocabulary.create!(
    number: v[:number],
    english: v[:english],
    japanese: v[:japanese],
    series: "スポーツ",
    level: "5級"
  )
end

houses = [
  { number: 1, english: "house", japanese: "家" },
  { number: 2, english: "kitchen", japanese: "台所" },
  { number: 3, english: "bedroom", japanese: "寝室" },
  { number: 4, english: "living room", japanese: "居間" },
  { number: 5, english: "bathroom", japanese: "お風呂、トイレ" },
  { number: 6, english: "garden", japanese: "庭" }
]

houses.each do |v|
  Vocabulary.create!(
    number: v[:number],
    english: v[:english],
    japanese: v[:japanese],
    series: "家",
    level: "5級"
  )
end

days = [
  { number: 1, english: "Sunday", japanese: "日曜日" },
  { number: 2, english: "Monday", japanese: "月曜日" },
  { number: 3, english: "Tuesday", japanese: "火曜日" },
  { number: 4, english: "Wednesday", japanese: "水曜日" },
  { number: 5, english: "Thursday", japanese: "木曜日" },
  { number: 6, english: "Friday", japanese: "金曜日" },
  { number: 7, english: "Saturday", japanese: "土曜日" }
]

days.each do |v|
  Vocabulary.create!(
    number: v[:number],
    english: v[:english],
    japanese: v[:japanese],
    series: "曜日",
    level: "5級"
  )
end

orders = [
  { number: 1, english: "one - first", japanese: "1-1番目の" },
  { number: 2, english: "two - second", japanese: "2-2番目の" },
  { number: 3, english: "three - third", japanese: "3-3番目の" },
  { number: 4, english: "four - fourth", japanese: "4-4番目の" },
  { number: 5, english: "five - fifth", japanese: "5-5番目の" },
  { number: 6, english: "six - sixth", japanese: "6-6番目の" },
  { number: 7, english: "seven - seventh", japanese: "7-7番目の" },
  { number: 8, english: "eight - eighth", japanese: "8-8番目の" },
  { number: 9, english: "nine - ninth", japanese: "9-9番目の" },
  { number: 10, english: "ten - tenth", japanese: "10-10番目の" },
  { number: 11, english: "eleven - eleventh", japanese: "11-11番目の" },
  { number: 12, english: "twelve - twelfth", japanese: "12-12番目の" }
]

orders.each do |v|
  Vocabulary.create!(
    number: v[:number],
    english: v[:english],
    japanese: v[:japanese],
    series: "数・順序",
    level: "5級"
  )
end

months = [
  { number: 1, english: "January", japanese: "1月" },
  { number: 2, english: "February", japanese: "2月" },
  { number: 3, english: "March", japanese: "3月" },
  { number: 4, english: "April", japanese: "4月" },
  { number: 5, english: "May", japanese: "5月" },
  { number: 6, english: "June", japanese: "6月" },
  { number: 7, english: "July", japanese: "7月" },
  { number: 8, english: "August", japanese: "8月" },
  { number: 9, english: "September", japanese: "9月" },
  { number: 10, english: "October", japanese: "10月" },
  { number: 11, english: "November", japanese: "11月" },
  { number: 12, english: "December", japanese: "12月" }
]

months.each do |v|
  Vocabulary.create!(
    number: v[:number],
    english: v[:english],
    japanese: v[:japanese],
    series: "月",
    level: "5級"
  )
end

transports = [
  { number: 1, english: "bike", japanese: "自転車" },
  { number: 2, english: "car", japanese: "車" },
  { number: 3, english: "bus", japanese: "バス" },
  { number: 4, english: "taxi", japanese: "タクシー" },
  { number: 5, english: "train", japanese: "電車" },
  { number: 6, english: "subway", japanese: "地下鉄" },
  { number: 7, english: "ship", japanese: "船" },
  { number: 8, english: "plane", japanese: "飛行機" }
]

transports.each do |v|
  Vocabulary.create!(
    number: v[:number],
    english: v[:english],
    japanese: v[:japanese],
    series: "乗り物",
    level: "5級"
  )
end

end



def create_chapters_for(textbook_name, chapters_data)
  textbook = Textbook.find_by!(name: textbook_name)

  chapters_data.each do |c|
    chapter = Chapter.find_or_initialize_by(
      textbook_id: textbook.id,
      series: c[:series],
      title: c[:title]
    )
    chapter.save!

    Array(c[:audio_files]).each do |file|
      Audio.find_or_initialize_by(
        chapter_id: chapter.id,
        file_name: file
      ).save!
    end
  end
end

ActiveRecord::Base.connection.tables.each do |table|
  next if table.in?(%w[schema_migrations ar_internal_metadata])

  ActiveRecord::Base.connection.execute(<<~SQL)
    SELECT setval(
      pg_get_serial_sequence('#{table}', 'id'),
      COALESCE((SELECT MAX(id) FROM #{table}), 1),
      true
    )
  SQL
end

ActiveRecord::Base.transaction do
  textbooks = [
    { name: "音トレ道場6段", series: "音トレ", level: "英検準1級", cover_image: "ontre_06.png" },
    { name: "音トレ道場5段", series: "音トレ", level: "英検2級", cover_image: "ontre_05.png" },
    { name: "音トレ道場4段", series: "音トレ", level: "英検準2級", cover_image: "ontre_04.png" },
    { name: "音トレ道場3段", series: "音トレ", level: "英検3級", cover_image: "ontre_03.png" },
    { name: "音トレ道場2段", series: "音トレ", level: "英検4級", cover_image: "ontre_02.png" },
    { name: "音トレ道場初段", series: "音トレ", level: "英検5級", cover_image: "ontre_01.png" },
    { name: "リズムでマスター英検準1級", series: "リズマス", level: "英検準1級", cover_image: "rhythm_06.png" },
    { name: "リズムでマスター英検2級", series: "リズマス", level: "英検2級", cover_image: "rhythm_05.png" },
    { name: "リズムでマスター英検準2級", series: "リズマス", level: "英検準2級", cover_image: "rhythm_04.png" },
    { name: "リズムでマスター英検3級", series: "リズマス", level: "英検3級", cover_image: "rhythm_03.png" },
    { name: "リズムでマスター英検4級", series: "リズマス", level: "英検4級", cover_image: "rhythm_02.png" },
    { name: "リズムでマスター英検５級", series: "リズマス", level: "英検5級", cover_image: "rhythm_01.png" },
  ]

  textbooks.each do |attrs|
    textbook = Textbook.find_or_initialize_by(name: attrs[:name])
    textbook.update!(attrs)
  end

  # ================================
  # 音トレ道場6段
  # ================================
  chapters_data6 = [
    # 長文
    { series: "長文", title: "TOPIC1 History 歴史", audio_files: ["ontre6_topic1.mp3"] },
    { series: "長文", title: "TOPIC2 Society 社会", audio_files: ["ontre6_topic2.mp3"] },
    { series: "長文", title: "TOPIC3 Economy 経済", audio_files: ["ontre6_topic3.mp3"] },
    { series: "長文", title: "TOPIC4 Science 科学", audio_files: ["ontre6_topic4.mp3"] },
    { series: "長文", title: "TOPIC5 Technology 技術", audio_files: ["ontre6_topic5.mp3"] },
    { series: "長文", title: "TOPIC6 Environmental Issues 環境問題", audio_files: ["ontre6_topic6.mp3"] },
    { series: "長文", title: "TOPIC7 Crimes and Judicial System 犯罪と司法システム", audio_files: ["ontre6_topic7.mp3"] },
    { series: "長文", title: "TOPIC8 Health and Medicine 健康・医療", audio_files: ["ontre6_topic8.mp3"] },
    { series: "長文", title: "TOPIC9 Psychology 心理学", audio_files: ["ontre6_topic9.mp3"] },
    { series: "長文", title: "TOPIC10 Politics 政治", audio_files: ["ontre6_topic10.mp3"] },
    { series: "長文", title: "TOPIC11 Education 教育", audio_files: ["ontre6_topic11.mp3"] },
    { series: "長文", title: "TOPIC12 Entertainment and Leisure 娯楽・レジャー", audio_files: ["ontre6_topic12.mp3"] },
    { series: "長文", title: "TOPIC13 Diet and Nutrition 食事と栄養学", audio_files: ["ontre6_topic13.mp3"] },
    { series: "長文", title: "TOPIC14 Industry 産業", audio_files: ["ontre6_topic14.mp3"] },
    { series: "長文", title: "TOPIC15 Agriculture 農業", audio_files: ["ontre6_topic15.mp3"] },
    { series: "長文", title: "TOPIC16 Customs 慣習・制度", audio_files: ["ontre6_topic16.mp3"] },
    { series: "長文", title: "TOPIC17 Business ビジネス", audio_files: ["ontre6_topic17.mp3"] },
    { series: "長文", title: "TOPIC18 Law 法律", audio_files: ["ontre6_topic18.mp3"] },
    { series: "長文", title: "TOPIC19 International Relations 国際関係", audio_files: ["ontre6_topic19.mp3"] },
    { series: "長文", title: "TOPIC20 Biology 生物", audio_files: ["ontre6_topic20.mp3"] },
    # リスニング
    { series: "リスニング", title: "SCENE1 Daily Life 日常の様々な場面での対話・連絡", audio_files: ["音トレ6段 SCENE1 No1","音トレ6段 SCENE1 No2","音トレ6段 SCENE1 No3","音トレ6段 SCENE1 Q1","音トレ6段 SCENE1 Q2","音トレ6段 SCENE1 Q3"] },
    { series: "リスニング", title: "SCENE2 College/Graduate School キャンパスでの対話・案内", audio_files: ["音トレ6段 SCENE2 No1","音トレ6段 SCENE2 No2","音トレ6段 SCENE2 No3","音トレ6段 SCENE2 Q1","音トレ6段 SCENE2 Q2","音トレ6段 SCENE2 Q3"] },
    { series: "リスニング", title: "SCENE3 Business Scenes ビジネスでの対話・連絡", audio_files: ["音トレ6段 SCENE3 No1","音トレ6段 SCENE3 No2","音トレ6段 SCENE3 No3","音トレ6段 SCENE3 Q1","音トレ6段 SCENE3 Q2","音トレ6段 SCENE3 Q3"] },
    { series: "リスニング", title: "SCENE4 Announcements/Sales Talk アナウンス・セールストーク", audio_files: ["音トレ6段 SCENE4 No1","音トレ6段 SCENE4 No2","音トレ6段 SCENE4 No3","音トレ6段 SCENE4 Q1","音トレ6段 SCENE4 Q2","音トレ6段 SCENE4 Q3"] },
    { series: "リスニング", title: "SCENE5 Lectures 講義", audio_files: ["音トレ6段 SCENE5 No1","音トレ6段 SCENE5 No2","音トレ6段 SCENE5 No3","音トレ6段 SCENE5 Q1","音トレ6段 SCENE5 Q2","音トレ6段 SCENE5 Q3"] }
  ]

  create_chapters_for("音トレ道場6段", chapters_data6)

  # ================================
  # 音トレ道場5段
  # ================================
  chapters_data5 = [
    { series: "長文", title: "TOPIC1 Education 教育", audio_files: ["ontre5_topic1.mp3"] },
    { series: "長文", title: "TOPIC2 Astronomy 天文学", audio_files: ["ontre5_topic2.mp3"] },
    { series: "長文", title: "TOPIC3 Culture① 文化①", audio_files: ["ontre5_topic3.mp3"] },
    { series: "長文", title: "TOPIC4 Environment 環境", audio_files: ["ontre5_topic4.mp3"] },
    { series: "長文", title: "TOPIC5 Travel & Transportation 旅行・交通", audio_files: ["ontre5_topic5.mp3"] },
    { series: "長文", title: "TOPIC6 Daily Life① 日常生活①（メール）", audio_files: ["ontre5_topic6.mp3"] },
    { series: "長文", title: "TOPIC7 Health & Medicine① 健康・医療①", audio_files: ["ontre5_topic7.mp3"] },
    { series: "長文", title: "TOPIC8 Resources and Energy 資源・エネルギー", audio_files: ["ontre5_topic8.mp3"] },
    { series: "長文", title: "TOPIC9 Natural Science 自然科学", audio_files: ["ontre5_topic9.mp3"] },
    { series: "長文", title: "TOPIC10 History 歴史", audio_files: ["ontre5_topic10.mp3"] },
    { series: "長文", title: "TOPIC11 Daily Life② 日常生活②（メール）", audio_files: ["ontre5_topic11.mp3"] },
    { series: "長文", title: "TOPIC12 Health & Medicine② 健康・医療②", audio_files: ["ontre5_topic12.mp3"] },
    { series: "長文", title: "TOPIC13 Technology 科学技術", audio_files: ["ontre5_topic13.mp3"] },
    { series: "長文", title: "TOPIC14 Space 天文・宇宙", audio_files: ["ontre5_topic14.mp3"] },
    { series: "長文", title: "TOPIC15 Ecology 生態系", audio_files: ["ontre5_topic15.mp3"] },
    { series: "長文", title: "TOPIC16 Daily Life③ 日常生活③（手紙）", audio_files: ["ontre5_topic16.mp3"] },
    { series: "長文", title: "TOPIC17 Health & Medicine③ 健康・医療③", audio_files: ["ontre5_topic17.mp3"] },
    { series: "長文", title: "TOPIC18 Culture② 文化②", audio_files: ["ontre5_topic18.mp3"] },
    { series: "長文", title: "TOPIC19 Society 社会", audio_files: ["ontre5_topic19.mp3"] },
    { series: "長文", title: "TOPIC20 Culture③ 文化③", audio_files: ["ontre5_topic20.mp3"] },
    { series: "リスニング", title: "Scene1 Situation Dialogues 様々な場面での対話", audio_files: ["音トレ5段 SCENE1 No1", "音トレ5段 SCENE Q1"] },
    { series: "リスニング", title: "Scene2 Story Narrations 様々なストーリーのナレーション", audio_files: ["音トレ5段 SCENE2 No1", "音トレ5段 SCENE2 Q1"] },
    { series: "リスニング", title: "Scene3 Speeches and Announcements 様々なスピーチ・お知らせ", audio_files: ["音トレ5段 SCENE3 No1", "音トレ5段 SCENE3 Q1"] },
    { series: "リスニング", title: "Scene4 Topic Narrations 様々な説明文", audio_files: ["音トレ5段 SCENE4 No1", "音トレ5段 SCENE4 Q1"] },
    { series: "リスニング", title: "Scene5 Listening Comprehension Mock Test リスニング・ミニ模試", audio_files: ["音トレ5段 SCENE5 No1", "音トレ5段 SCENE5 Q1"] }
  ]

  create_chapters_for("音トレ道場5段", chapters_data5)

  # ================================
  # 音トレ道場4段
  # ================================
  chapters_data4 = [
    { series: "長文", title: "TOPIC1 Daily Life 日常生活", audio_files: ["ontre4_topic1.mp3"]},
    { series: "長文", title: "TOPIC2 Business ビジネス", audio_files: ["ontre4_topic2.mp3"]},
    { series: "長文", title: "TOPIC3 Travel & Transportation 旅行・交通", audio_files: ["ontre4_topic3.mp3"]},
    { series: "長文", title: "TOPIC4 Entertainment and Leisure 娯楽・レジャー", audio_files: ["ontre4_topic4.mp3"]},
    { series: "長文", title: "TOPIC5 Health & Medicine5 健康・医療", audio_files: ["ontre4_topic5.mp3"]},
    { series: "長文", title: "TOPIC6 Technology 科学技術", audio_files: ["ontre4_topic6.mp3"]},
    { series: "長文", title: "TOPIC7 Natural Science 自然科学", audio_files: ["ontre4_topic7.mp3"]},
    { series: "長文", title: "TOPIC8 Politics 政治", audio_files: ["ontre4_topic8.mp3"]},
    { series: "長文", title: "TOPIC9 Environment 環境", audio_files: ["ontre4_topic9.mp3"]},
    { series: "長文", title: "TOPIC10 Education 教育", audio_files: ["ontre4_topic10.mp3"]},
    { series: "長文", title: "TOPIC11 Culture 文化", audio_files: ["ontre4_topic11.mp3"]},
    { series: "長文", title: "TOPIC12 Society 社会", audio_files: ["ontre4_topic12.mp3"]},
    { series: "長文", title: "TOPIC13 Biology 伝記", audio_files: ["ontre4_topic13.mp3"]},
    { series: "長文", title: "TOPIC14 History 歴史", audio_files: ["ontre4_topic14.mp3"]},
    { series: "長文", title: "TOPIC15 International Affairs 国際情勢", audio_files: ["音トレ4段 TOPIC15"]},
    { series: "リスニング", title: "Scene1 Restaurant・Dining レストラン・食事", audio_files: ["音トレ4段 SCENE1 No1", "音トレ4段 SCENE1 Q1"]},
    { series: "リスニング", title: "Scene2 Shopping 買い物", audio_files: ["音トレ4段 SCENE2 No1", "音トレ4段 SCENE2 Q1"]},
    { series: "リスニング", title: "Scene3 Telephone Conversation 電話での会話", audio_files: ["音トレ4段 SCENE3 No1", "音トレ4段 SCENE3 Q1"]},
    { series: "リスニング", title: "Scene4 School Life 学校生活", audio_files: ["音トレ4段 SCENE4 No1", "音トレ4段 SCENE4 Q1"]},
    { series: "リスニング", title: "Scene5 Traveling & Leisure 旅行・レジャー", audio_files: ["音トレ4段 SCENE5 No1", "音トレ4段 SCENE5 Q1"]},
    { series: "リスニング", title: "Scene6 Offer & Request 誘い・依頼", audio_files: ["音トレ4段 SCENE6 No1", "音トレ4段 SCENE6 Q1"]},
    { series: "リスニング", title: "Scene7 Daily Expressions① 日常生活① 様々な表現", audio_files: ["音トレ4段 SCENE7 No1", "音トレ4段 SCENE7 Q1"]},
    { series: "リスニング", title: "Scene8 Daily Expressions② 日常生活② 類似表現・反対表現", audio_files: ["音トレ4段 SCENE8 No1", "音トレ4段 SCENE8 Q1"]},
    { series: "リスニング", title: "Scene9 Narration① 様々なナレーション①", audio_files: ["音トレ4段 SCENE9 No1", "音トレ4段 SCENE9 Q1"]},
    { series: "リスニング", title: "Scene10 Narration② 様々なナレーション②", audio_files: ["音トレ4段 SCENE10 No1", "音トレ4段 SCENE10 Q1"]}
  ]

  create_chapters_for("音トレ道場4段", chapters_data4)

  # ================================
  # 音トレ道場3段〜初段（例: 簡略化）
  # ================================

  chapters_data3 = [
    { series: "長文", title: "TOPIC1", audio_files: ["ontre3_topic1.mp3"]},
    { series: "長文", title: "TOPIC2", audio_files: ["ontre3_topic2.mp3"]},
    { series: "長文", title: "TOPIC3", audio_files: ["ontre3_topic3.mp3"]},
    { series: "長文", title: "TOPIC4", audio_files: ["ontre3_topic4.mp3"]},
    { series: "長文", title: "TOPIC5", audio_files: ["ontre3_topic5.mp3"]},
    { series: "長文", title: "TOPIC6", audio_files: ["ontre3_topic6.mp3"]},
    { series: "長文", title: "TOPIC7", audio_files: ["ontre3_topic7.mp3"]},
    { series: "長文", title: "TOPIC8", audio_files: ["ontre3_topic8.mp3"]},
    { series: "長文", title: "TOPIC9", audio_files: ["ontre3_topic9.mp3"]},
    { series: "長文", title: "TOPIC10", audio_files: ["ontre3_topic10.mp3"]},
    { series: "長文", title: "TOPIC11", audio_files: ["ontre3_topic11.mp3"]},
    { series: "長文", title: "TOPIC12", audio_files: ["ontre3_topic12.mp3"]},
    { series: "長文", title: "TOPIC13", audio_files: ["ontre3_topic13.mp3"]},
    { series: "長文", title: "TOPIC14", audio_files: ["ontre3_topic14.mp3"]},
    { series: "長文", title: "TOPIC15", audio_files: ["ontre3_topic15.mp3"]},
    { series: "リスニング", title: "Scene1", audio_files: ["音トレ3段 SCENE1 No1", "音トレ3段 SCENE1 Q1"]},
    { series: "リスニング", title: "Scene2", audio_files: ["音トレ3段 SCENE2 No1", "音トレ3段 SCENE2 Q1"]},
    { series: "リスニング", title: "Scene3", audio_files: ["音トレ3段 SCENE3 No1", "音トレ3段 SCENE3 Q1"]},
    { series: "リスニング", title: "Scene4", audio_files: ["音トレ3段 SCENE4 No1", "音トレ3段 SCENE4 Q1"]},
    { series: "リスニング", title: "Scene5", audio_files: ["音トレ3段 SCENE5 No1", "音トレ3段 SCENE5 Q1"]},
    { series: "リスニング", title: "Scene6", audio_files: ["音トレ3段 SCENE6 No1", "音トレ3段 SCENE6 Q1"]},
    { series: "リスニング", title: "Scene7", audio_files: ["音トレ3段 SCENE7 No1", "音トレ3段 SCENE7 Q1"]},
    { series: "リスニング", title: "Scene8", audio_files: ["音トレ3段 SCENE8 No1", "音トレ3段 SCENE8 Q1"]},
  ]
  
  create_chapters_for("音トレ道場3段", chapters_data3)

    # ================================
  # 音トレ道場2段
  # ================================

  chapters_data2 = [

    { series: "長文", title: "TOPIC1", audio_files: ["音トレ2段TOPIC1.mp3"]},
    { series: "長文", title: "TOPIC2", audio_files: ["音トレ2段TOPIC2.mp3"]},
    { series: "長文", title: "TOPIC3", audio_files: ["音トレ2段TOPIC3.mp3"]},
    { series: "長文", title: "TOPIC4", audio_files: ["音トレ2段TOPIC4.mp3"]},
    { series: "長文", title: "TOPIC5", audio_files: ["音トレ2段TOPIC5.mp3"]},
    { series: "長文", title: "TOPIC6", audio_files: ["音トレ2段TOPIC6.mp3"]},
    { series: "長文", title: "TOPIC7", audio_files: ["音トレ2段TOPIC7.mp3"]},
    { series: "長文", title: "TOPIC8", audio_files: ["音トレ2段TOPIC8.mp3"]},
    { series: "長文", title: "TOPIC9", audio_files: ["音トレ2段TOPIC9.mp3"]},
    { series: "長文", title: "TOPIC10", audio_files: ["音トレ2段TOPIC10.mp3"]},
    { series: "リスニング", title: "Scene1", audio_files: ["音トレ2段 SCENE1 No1", "音トレ2段 SCENE1 Q1"]},
    { series: "リスニング", title: "Scene2", audio_files: ["音トレ2段 SCENE2 No1", "音トレ2段 SCENE2 Q1"]},
    { series: "リスニング", title: "Scene3", audio_files: ["音トレ2段 SCENE3 No1", "音トレ2段 SCENE3 Q1"]},
    { series: "リスニング", title: "Scene4", audio_files: ["音トレ2段 SCENE4 No1", "音トレ2段 SCENE4 Q1"]},
    { series: "リスニング", title: "Scene5", audio_files: ["音トレ2段 SCENE5 No1", "音トレ2段 SCENE5 Q1"]},
    { series: "リスニング", title: "Scene6", audio_files: ["音トレ2段 SCENE6 No1", "音トレ2段 SCENE6 Q1"]},
    { series: "リスニング", title: "Scene7", audio_files: ["音トレ2段 SCENE7 No1", "音トレ2段 SCENE7 Q1"]},
    { series: "リスニング", title: "Scene8", audio_files: ["音トレ2段 SCENE8 No1", "音トレ2段 SCENE8 Q1"]},
  ]
  
  create_chapters_for("音トレ道場2段", chapters_data2)


  chapters_data1 = [
    { series: "長文", title: "TOPIC1", audio_files: ["TOPIC1.mp3"]},
    { series: "長文", title: "TOPIC2", audio_files: ["TOPIC2.mp3"]},
    { series: "長文", title: "TOPIC3", audio_files: ["TOPIC3.mp3"]},
    { series: "長文", title: "TOPIC4", audio_files: ["TOPIC4.mp3"]},
    { series: "長文", title: "TOPIC5", audio_files: ["TOPIC5.mp3"]},
    { series: "長文", title: "TOPIC6", audio_files: ["TOPIC6.mp3"]},
    { series: "長文", title: "TOPIC7", audio_files: ["TOPIC7.mp3"]},
    { series: "長文", title: "TOPIC8", audio_files: ["TOPIC8.mp3"]},
    { series: "長文", title: "TOPIC9", audio_files: ["TOPIC9.mp3"]},
    { series: "長文", title: "TOPIC10", audio_files: ["TOPIC10.mp3"]},
    { series: "長文", title: "TOPIC11", audio_files: ["TOPIC11.mp3"]},
    { series: "長文", title: "TOPIC12", audio_files: ["TOPIC12.mp3"]},
    { series: "長文", title: "TOPIC13", audio_files: ["TOPIC13.mp3"]},
    { series: "長文", title: "TOPIC14", audio_files: ["TOPIC14.mp3"]},
    { series: "リスニング", title: "Scene1", audio_files: ["音トレ初段 SCENE1 No1", "音トレ初段 SCENE1 No2", "音トレ初段 SCENE1 No3", "音トレ初段 SCENE1 No4", "音トレ初段 SCENE1 Q1", "音トレ初段 SCENE1 Q2", "音トレ初段 SCENE1 Q3", "音トレ初段 SCENE1 Q4", "音トレ初段 SCENE1 Q5", "音トレ初段 SCENE1 Q6", "音トレ初段 SCENE1 Q7", "音トレ初段 SCENE1 Q8"]},
    { series: "リスニング", title: "Scene2", audio_files: ["音トレ初段 SCENE2 No1", "音トレ初段 SCENE2 No2", "音トレ初段 SCENE2 No3", "音トレ初段 SCENE2 No4", "音トレ初段 SCENE2 Q1", "音トレ初段 SCENE2 Q2", "音トレ初段 SCENE2 Q3", "音トレ初段 SCENE2 Q4", "音トレ初段 SCENE2 Q5", "音トレ初段 SCENE2 Q6", "音トレ初段 SCENE2 Q7", "音トレ初段 SCENE2 Q8"]},
    { series: "リスニング", title: "Scene3", audio_files: ["音トレ初段 SCENE3 No1", "音トレ初段 SCENE3 No2", "音トレ初段 SCENE3 No3", "音トレ初段 SCENE3 No4", "音トレ初段 SCENE3 Q1", "音トレ初段 SCENE3 Q2", "音トレ初段 SCENE3 Q3", "音トレ初段 SCENE3 Q4", "音トレ初段 SCENE3 Q5", "音トレ初段 SCENE3 Q6", "音トレ初段 SCENE3 Q7", "音トレ初段 SCENE3 Q8"]},
    { series: "リスニング", title: "Scene4", audio_files: ["音トレ初段 SCENE4 No1", "音トレ初段 SCENE4 No2", "音トレ初段 SCENE4 No3", "音トレ初段 SCENE4 No4", "音トレ初段 SCENE4 Q1", "音トレ初段 SCENE4 Q2", "音トレ初段 SCENE4 Q3", "音トレ初段 SCENE4 Q4", "音トレ初段 SCENE4 Q5", "音トレ初段 SCENE4 Q6", "音トレ初段 SCENE4 Q7", "音トレ初段 SCENE4 Q8"]},
  ]
    create_chapters_for("音トレ道場初段", chapters_data1)

  chapters_data1 = [
    { series: "フレーズ", title: "Unit1", audio_files: ["Unit1.mp3"]},
    { series: "フレーズ", title: "Unit2", audio_files: ["Unit2.mp3"]},
    { series: "フレーズ", title: "Unit3", audio_files: ["Unit3.mp3"]},
    { series: "フレーズ", title: "Unit4", audio_files: ["Unit4.mp3"]},
    { series: "フレーズ", title: "Unit5", audio_files: ["Unit5.mp3"]},
    { series: "フレーズ", title: "Unit6", audio_files: ["Unit6.mp3"]},
    { series: "フレーズ", title: "Unit7", audio_files: ["Unit7.mp3"]},
    { series: "フレーズ", title: "Unit8", audio_files: ["Unit8.mp3"]},
    { series: "フレーズ", title: "Unit9", audio_files: ["Unit9.mp3"]},
    { series: "フレーズ", title: "Unit10", audio_files: ["Unit10.mp3"]},
    { series: "フレーズ", title: "Unit11", audio_files: ["Unit11.mp3"]},
    { series: "フレーズ", title: "Unit12", audio_files: ["Unit12.mp3"]},
    { series: "フレーズ", title: "Unit13", audio_files: ["Unit13.mp3"]},
    { series: "フレーズ", title: "Unit14", audio_files: ["Unit14.mp3"]},
    { series: "フレーズ", title: "Unit15", audio_files: ["Unit15.mp3"]},
    { series: "フレーズ", title: "Unit16", audio_files: ["Unit16.mp3"]},
    { series: "フレーズ", title: "Unit17", audio_files: ["Unit17.mp3"]},
    { series: "フレーズ", title: "Unit18", audio_files: ["Unit18.mp3"]},
    { series: "フレーズ", title: "Unit19", audio_files: ["Unit19.mp3"]},
    { series: "フレーズ", title: "Unit20", audio_files: ["Unit20.mp3"]},
    { series: "フレーズ", title: "Unit21", audio_files: ["Unit21.mp3"]},
    { series: "フレーズ", title: "Unit22", audio_files: ["Unit22.mp3"]},
    { series: "フレーズ", title: "Unit23", audio_files: ["Unit23.mp3"]},
    { series: "フレーズ", title: "Unit24", audio_files: ["Unit24.mp3"]},
    { series: "フレーズ", title: "Unit25", audio_files: ["Unit25.mp3"]},
    { series: "フレーズ", title: "Unit26", audio_files: ["Unit26.mp3"]},
    { series: "リスニング問題にチャレンジ", title: "Unit1 リスニング問題にチャレンジ", audio_files: ["Unit1 リスニング問題にチャレンジ"]},
    { series: "リスニング問題にチャレンジ", title: "Unit2 リスニング問題にチャレンジ", audio_files: ["Unit2 リスニング問題にチャレンジ"]},
    { series: "リスニング問題にチャレンジ", title: "Unit3 リスニング問題にチャレンジ", audio_files: ["Unit3 リスニング問題にチャレンジ"]},
    { series: "リスニング問題にチャレンジ", title: "Unit4 リスニング問題にチャレンジ", audio_files: ["Unit4 リスニング問題にチャレンジ"]},
    { series: "リスニング問題にチャレンジ", title: "Unit5 リスニング問題にチャレンジ", audio_files: ["Unit5 リスニング問題にチャレンジ"]},
    { series: "リスニング問題にチャレンジ", title: "Unit6 リスニング問題にチャレンジ", audio_files: ["Unit6 リスニング問題にチャレンジ"]},
    { series: "リスニング問題にチャレンジ", title: "Unit7 リスニング問題にチャレンジ", audio_files: ["Unit7 リスニング問題にチャレンジ"]},
    { series: "リスニング問題にチャレンジ", title: "Unit8 リスニング問題にチャレンジ", audio_files: ["Unit8 リスニング問題にチャレンジ"]},
    { series: "リスニング問題にチャレンジ", title: "Unit9 リスニング問題にチャレンジ", audio_files: ["Unit9 リスニング問題にチャレンジ"]},
    { series: "リスニング問題にチャレンジ", title: "Unit10 リスニング問題にチャレンジ", audio_files: ["Unit10 リスニング問題にチャレンジ"]},
    { series: "リスニング問題にチャレンジ", title: "Unit11 リスニング問題にチャレンジ", audio_files: ["Unit11 リスニング問題にチャレンジ"]},
    { series: "リスニング問題にチャレンジ", title: "Unit12 リスニング問題にチャレンジ", audio_files: ["Unit12 リスニング問題にチャレンジ"]},
    { series: "リスニング問題にチャレンジ", title: "Unit13 リスニング問題にチャレンジ", audio_files: ["Unit13 リスニング問題にチャレンジ"]},
    { series: "リスニング問題にチャレンジ", title: "Unit14 リスニング問題にチャレンジ", audio_files: ["Unit14 リスニング問題にチャレンジ"]},
    { series: "リスニング問題にチャレンジ", title: "Unit15 リスニング問題にチャレンジ", audio_files: ["Unit15 リスニング問題にチャレンジ"]},
    { series: "リスニング問題にチャレンジ", title: "Unit16 リスニング問題にチャレンジ", audio_files: ["Unit16 リスニング問題にチャレンジ"]},
    { series: "リスニング問題にチャレンジ", title: "Unit17 リスニング問題にチャレンジ", audio_files: ["Unit17 リスニング問題にチャレンジ"]},
    { series: "リスニング問題にチャレンジ", title: "Unit18 リスニング問題にチャレンジ", audio_files: ["Unit18 リスニング問題にチャレンジ"]},
    { series: "リスニング問題にチャレンジ", title: "Unit19 リスニング問題にチャレンジ", audio_files: ["Unit19 リスニング問題にチャレンジ"]},
    { series: "リスニング問題にチャレンジ", title: "Unit20 リスニング問題にチャレンジ", audio_files: ["Unit20 リスニング問題にチャレンジ"]},
    { series: "リスニング問題にチャレンジ", title: "Unit21 リスニング問題にチャレンジ", audio_files: ["Unit21 リスニング問題にチャレンジ"]},
    { series: "リスニング問題にチャレンジ", title: "Unit22 リスニング問題にチャレンジ", audio_files: ["Unit22 リスニング問題にチャレンジ"]},
    { series: "リスニング問題にチャレンジ", title: "Unit23 リスニング問題にチャレンジ", audio_files: ["Unit23 リスニング問題にチャレンジ"]},
    { series: "リスニング問題にチャレンジ", title: "Unit24 リスニング問題にチャレンジ", audio_files: ["Unit24 リスニング問題にチャレンジ"]},
    { series: "リスニング問題にチャレンジ", title: "Unit25 リスニング問題にチャレンジ", audio_files: ["Unit25 リスニング問題にチャレンジ"]},
    { series: "リスニング問題にチャレンジ", title: "Unit26 リスニング問題にチャレンジ", audio_files: ["Unit26 リスニング問題にチャレンジ"]}
]
create_chapters_for("リズムでマスター英検５級", chapters_data1)
end