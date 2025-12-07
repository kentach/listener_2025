textbooks = [
  { name: "音トレ道場6段", series: "音トレ", level: "英検準1級", cover_image: "ontre_06.png" },
  { name: "音トレ道場5段", series: "音トレ", level: "英検2級", cover_image: "ontre_05.png" },
  { name: "音トレ道場4段", series: "音トレ", level: "英検準2級", cover_image: "ontre_04.png" },
  { name: "音トレ道場3段", series: "音トレ", level: "英検3級", cover_image: "ontre_03.png" },
  { name: "音トレ道場2段", series: "音トレ", level: "英検4級", cover_image: "ontre_02.png" },
  { name: "音トレ道場初段", series: "音トレ", level: "英検5級", cover_image: "ontre_01.png" },
  { name: "リズムでマスター英検準1級", series: "リズムでマスター", level: "英検準1級", cover_image: "rhythm_06.png" },
  { name: "リズムでマスター英検2級", series: "リズムでマスター", level: "英検2級", cover_image: "rhythm_05.png" },
  { name: "リズムでマスター英検準2級", series: "リズムでマスター", level: "英検準2級", cover_image: "rhythm_04.png" },
  { name: "リズムでマスター英検3級", series: "リズムでマスター", level: "英検3級", cover_image: "rhythm_03.png" },
  { name: "リズムでマスター英検4級", series: "リズムでマスター", level: "英検4級", cover_image: "rhythm_02.png" },
  { name: "リズムでマスター英検5級", series: "リズムでマスター", level: "英検5級", cover_image: "rhythm_01.png" }
]

textbooks.each do |attrs|
  Textbook.find_or_create_by!(name: attrs[:name]) do |t|
    t.series = attrs[:series]
    t.level = attrs[:level]
    t.cover_image = attrs[:cover_image]
  end
end

textbook6 = Textbook.find_by(name: "音トレ道場6段")

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
  { series: "リスニング", title: "SCENE1 Daily Life 日常の様々な場面での対話・連絡", audio_files: ["ontre6_scene1_No1.mp3","ontre6_scene1_No2.mp3","ontre6_scene1_No3.mp3","ontre6_scene1_Q1.mp3","ontre6_scene1_Q2.mp3","ontre6_scene1_Q3.mp3"] },
  { series: "リスニング", title: "SCENE2 College/Graduate School キャンパスでの対話・案内", audio_files: ["ontre6_scene2_No1.mp3","ontre6_scene2_No2.mp3","ontre6_scene2_No3.mp3","ontre6_scene2_Q1.mp3","ontre6_scene2_Q2.mp3","ontre6_scene2_Q3.mp3"] },
  { series: "リスニング", title: "SCENE3 Business Scenes ビジネスでの対話・連絡", audio_files: ["ontre6_scene3_No1.mp3","ontre6_scene3_No2.mp3","ontre6_scene3_No3.mp3","ontre6_scene3_Q1.mp3","ontre6_scene3_Q2.mp3","ontre6_scene3_Q3.mp3"] },
  { series: "リスニング", title: "SCENE4 Announcements/Sales Talk アナウンス・セールストーク", audio_files: ["ontre6_scene4_No1.mp3","ontre6_scene4_No2.mp3","ontre6_scene4_No3.mp3","ontre6_scene4_Q1.mp3","ontre6_scene4_Q2.mp3","ontre6_scene4_Q3.mp3"] },
  { series: "リスニング", title: "SCENE5 Lectures 講義", audio_files: ["ontre6_scene5_No1.mp3","ontre6_scene5_No2.mp3","ontre6_scene5_No3.mp3","ontre6_scene5_Q1.mp3","ontre6_scene5_Q2.mp3","ontre6_scene5_Q3.mp3"] }
]

chapters_data6.each do |chapter_attrs|
  chapter = Chapter.create!(textbook: textbook6, series: chapter_attrs[:series], title: chapter_attrs[:title])
  chapter_attrs[:audio_files].each { |file_name| Audio.create!(chapter: chapter, file_name: file_name) }
end

# ===========================
# 音トレ道場5段
# ===========================
textbook5 = Textbook.find_by(name: "音トレ道場5段")

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
  { series: "リスニング", title: "Scene1 Situation Dialogues 様々な場面での対話", audio_files: ["ontre5_scene1_No1.mp3", "ontre5_scene1_Q1.mp3"] },
  { series: "リスニング", title: "Scene2 Story Narrations 様々なストーリーのナレーション", audio_files: ["ontre5_scene2_No1.mp3", "ontre5_scene2_Q1.mp3"] },
  { series: "リスニング", title: "Scene3 Speeches and Announcements 様々なスピーチ・お知らせ", audio_files: ["ontre5_scene3_No1.mp3", "ontre5_scene3_Q1.mp3"] },
  { series: "リスニング", title: "Scene4 Topic Narrations 様々な説明文", audio_files: ["ontre5_scene4_No1.mp3", "ontre5_scene4_Q1.mp3"] },
  { series: "リスニング", title: "Scene5 Listening Comprehension Mock Test リスニング・ミニ模試", audio_files: ["ontre5_scene5_No1.mp3", "ontre5_scene5_Q1.mp3"] }
]

chapters_data5.each do |chapter_attrs|
  chapter = Chapter.create!(textbook: textbook5, series: chapter_attrs[:series], title: chapter_attrs[:title])
  chapter_attrs[:audio_files].each { |file_name| Audio.create!(chapter: chapter, file_name: file_name) }
end

textbook4 = Textbook.find_by(name: "音トレ道場4段")

chapters_data4 = [
  {series: "長文", title: "TOPIC1 Daily Life 日常生活", audio_files: ["ontre4_topic1.mp3"]},
  {series: "長文", title: "TOPIC2 Business ビジネス", audio_files: ["ontre4_topic2.mp3"]},
  {series: "長文", title: "TOPIC3 Travel & Transportation 旅行・交通", audio_files: ["ontre4_topic3.mp3"]},
  {series: "長文", title: "TOPIC4 Entertainment and Leisure 娯楽・レジャー", audio_files: ["ontre4_topic4.mp3"]},
  {series: "長文", title: "TOPIC5 Health & Medicine5 健康・医療", audio_files: ["ontre4_topic5.mp3"]},
  {series: "長文", title: "TOPIC6 Technology 科学技術", audio_files: ["ontre4_topic6.mp3"]},
  {series: "長文", title: "TOPIC7 Natural Science 自然科学", audio_files: ["ontre4_topic7.mp3"]},
  {series: "長文", title: "TOPIC8 Politics 政治", audio_files: ["ontre4_topic8.mp3"]},
  {series: "長文", title: "TOPIC9 Environment 環境", audio_files: ["ontre4_topic9.mp3"]},
  {series: "長文", title: "TOPIC10 Education 教育", audio_files: ["ontre4_topic10.mp3"]},
  {series: "長文", title: "TOPIC11 Culture 文化", audio_files: ["ontre4_topic11.mp3"]},
  {series: "長文", title: "TOPIC12 Society 社会", audio_files: ["ontre4_topic12.mp3"]},
  {series: "長文", title: "TOPIC13 Biology 伝記", audio_files: ["ontre4_topic13.mp3"]},
  {series: "長文", title: "TOPIC14 History 歴史", audio_files: ["ontre4_topic14.mp3"]},
  {series: "長文", title: "TOPIC15 International Affairs 国際情勢", audio_files: ["ontre4_topic15.mp3"]},
  {series: "リスニング", title: "Scene1 Restaurant・Dining レストラン・食事", audio_files: ["ontre4_scene1_No1.mp3", "ontre4_scene1_Q1.mp3"]},
  {series: "リスニング", title: "Scene2 Shopping 買い物", audio_files: ["ontre4_scene2_No1.mp3", "ontre4_scene2_Q1.mp3"]},
  {series: "リスニング", title: "Scene3 Telephone Conversation 電話での会話", audio_files: ["ontre4_scene3_No1.mp3", "ontre4_scene3_Q1.mp3"]},
  {series: "リスニング", title: "Scene4 School Life 学校生活", audio_files: ["ontre4_scene4_No1.mp3", "ontre4_scene4_Q1.mp3"]},
  {series: "リスニング", title: "Scene5 Traveling & Leisure 旅行・レジャー", audio_files: ["ontre4_scene5_No1.mp3", "ontre4_scene5_Q1.mp3"]},
  {series: "リスニング", title: "Scene6 Offer & Request 誘い・依頼", audio_files: ["ontre4_scene6_No1.mp3", "ontre4_scene6_Q1.mp3"]},
  {series: "リスニング", title: "Scene7 Daily Expressions① 日常生活① 様々な表現", audio_files: ["ontre4_scene7_No1.mp3", "ontre4_scene7_Q1.mp3"]},
  {series: "リスニング", title: "Scene8 Daily Expressions② 日常生活② 類似表現・反対表現", audio_files: ["ontre4_scene8_No1.mp3", "ontre4_scene8_Q1.mp3"]},
  {series: "リスニング", title: "Scene9 Narration① 様々なナレーション①", audio_files: ["ontre4_scene9_No1.mp3", "ontre4_scene9_Q1.mp3"]},
  {series: "リスニング", title: "Scene10 Narration② 様々なナレーション②", audio_files: ["ontre4_scene10_No1.mp3", "ontre4_scene10_Q1.mp3"]}
]

chapters_data4.each do |chapter_attrs|
  chapter = Chapter.create!(textbook: textbook4, series: chapter_attrs[:series], title: chapter_attrs[:title])
  chapter_attrs[:audio_files].each { |file_name| Audio.create!(chapter: chapter, file_name: file_name) }
end
