puts "🔧 Fixing PostgreSQL sequences..."

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
    { name: "リズムでマスター英検５級", series: "リズマス", level: "英検5級", cover_image: "rhythm_01.png" },
    { name: "リズムでマスター英検4級", series: "リズマス", level: "英検4級", cover_image: "rhythm_02.png" },
    { name: "リズムでマスター英検3級", series: "リズマス", level: "英検3級", cover_image: "rhythm_03.png" },
    { name: "リズムでマスター英検準2級", series: "リズマス", level: "英検準2級", cover_image: "rhythm_04.png" },
    { name: "リズムでマスター英検2級", series: "リズマス", level: "英検2級", cover_image: "rhythm_05.png" },
    { name: "リズムでマスター英検準1級", series: "リズマス", level: "英検準1級", cover_image: "rhythm_06.png" }
  ]

  textbooks.each do |attrs|
    textbook = Textbook.find_or_initialize_by(name: attrs[:name])
    textbook.update!(attrs)
  end


  # -------------------------------
  # Helper: chapter + audio の作成
  # -------------------------------
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
    { series: "リスニング", title: "SCENE1 Daily Life 日常の様々な場面での対話・連絡", audio_files: ["音トレ6段SCENE1_No1.mp3","音トレ6段SCENE1_No2.mp3","音トレ6段SCENE1_No3.mp3","音トレ6段SCENE1_Q1.mp3","音トレ6段SCENE1_Q2.mp3","音トレ6段SCENE1_Q3.mp3"] },
    { series: "リスニング", title: "SCENE2 College/Graduate School キャンパスでの対話・案内", audio_files: ["音トレ6段SCENE2_No1.mp3","音トレ6段SCENE2_No2.mp3","音トレ6段SCENE2_No3.mp3","音トレ6段SCENE2_Q1.mp3","音トレ6段SCENE2_Q2.mp3","音トレ6段SCENE2_Q3.mp3"] },
    { series: "リスニング", title: "SCENE3 Business Scenes ビジネスでの対話・連絡", audio_files: ["音トレ6段SCENE3_No1.mp3","音トレ6段SCENE3_No2.mp3","音トレ6段SCENE3_No3.mp3","音トレ6段SCENE3_Q1.mp3","音トレ6段SCENE3_Q2.mp3","音トレ6段SCENE3_Q3.mp3"] },
    { series: "リスニング", title: "SCENE4 Announcements/Sales Talk アナウンス・セールストーク", audio_files: ["音トレ6段SCENE4_No1.mp3","音トレ6段SCENE4_No2.mp3","音トレ6段SCENE4_No3.mp3","音トレ6段SCENE4_Q1.mp3","音トレ6段SCENE4_Q2.mp3","音トレ6段SCENE4_Q3.mp3"] },
    { series: "リスニング", title: "SCENE5 Lectures 講義", audio_files: ["音トレ6段SCENE5_No1.mp3","音トレ6段SCENE5_No2.mp3","音トレ6段SCENE5_No3.mp3","音トレ6段SCENE5_Q1.mp3","音トレ6段SCENE5_Q2.mp3","音トレ6段SCENE5_Q3.mp3"] }
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
    { series: "リスニング", title: "Scene1 Situation Dialogues 様々な場面での対話", audio_files: ["音トレ5段SCENE1_No1.mp3", "音トレ5段SCENE_Q1.mp3"] },
    { series: "リスニング", title: "Scene2 Story Narrations 様々なストーリーのナレーション", audio_files: ["音トレ5段SCENE2_No1.mp3", "音トレ5段SCENE2_Q1.mp3"] },
    { series: "リスニング", title: "Scene3 Speeches and Announcements 様々なスピーチ・お知らせ", audio_files: ["音トレ5段SCENE3_No1.mp3", "音トレ5段SCENE3_Q1.mp3"] },
    { series: "リスニング", title: "Scene4 Topic Narrations 様々な説明文", audio_files: ["音トレ5段SCENE4_No1.mp3", "音トレ5段SCENE4_Q1.mp3"] },
    { series: "リスニング", title: "Scene5 Listening Comprehension Mock Test リスニング・ミニ模試", audio_files: ["音トレ5段SCENE5_No1.mp3", "音トレ5段SCENE5_Q1.mp3"] }
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
    { series: "長文", title: "TOPIC15 International Affairs 国際情勢", audio_files: ["音トレ4段TOPIC15.mp3"]},
    { series: "リスニング", title: "Scene1 Restaurant・Dining レストラン・食事", audio_files: ["音トレ4段SCENE1_No1.mp3", "音トレ4段SCENE1_Q1.mp3"]},
    { series: "リスニング", title: "Scene2 Shopping 買い物", audio_files: ["音トレ4段SCENE2_No1.mp3", "音トレ4段SCENE2_Q1.mp3"]},
    { series: "リスニング", title: "Scene3 Telephone Conversation 電話での会話", audio_files: ["音トレ4段SCENE3_No1.mp3", "音トレ4段SCENE3_Q1.mp3"]},
    { series: "リスニング", title: "Scene4 School Life 学校生活", audio_files: ["音トレ4段SCENE4_No1.mp3", "音トレ4段SCENE4_Q1.mp3"]},
    { series: "リスニング", title: "Scene5 Traveling & Leisure 旅行・レジャー", audio_files: ["音トレ4段SCENE5_No1.mp3", "音トレ4段SCENE5_Q1.mp3"]},
    { series: "リスニング", title: "Scene6 Offer & Request 誘い・依頼", audio_files: ["音トレ4段SCENE6_No1.mp3", "音トレ4段SCENE6_Q1.mp3"]},
    { series: "リスニング", title: "Scene7 Daily Expressions① 日常生活① 様々な表現", audio_files: ["音トレ4段SCENE7_No1.mp3", "音トレ4段SCENE7_Q1.mp3"]},
    { series: "リスニング", title: "Scene8 Daily Expressions② 日常生活② 類似表現・反対表現", audio_files: ["音トレ4段SCENE8_No1.mp3", "音トレ4段SCENE8_Q1.mp3"]},
    { series: "リスニング", title: "Scene9 Narration① 様々なナレーション①", audio_files: ["音トレ4段SCENE9_No1.mp3", "音トレ4段SCENE9_Q1.mp3"]},
    { series: "リスニング", title: "Scene10 Narration② 様々なナレーション②", audio_files: ["音トレ4段SCENE10_No1.mp3", "音トレ4段SCENE10_Q1.mp3"]}
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
    { series: "リスニング", title: "Scene1", audio_files: ["音トレ3段SCENE1_No1.mp3", "音トレ3段SCENE1_Q1.mp3"]},
    { series: "リスニング", title: "Scene2", audio_files: ["音トレ3段SCENE2_No1.mp3", "音トレ3段SCENE2_Q1.mp3"]},
    { series: "リスニング", title: "Scene3", audio_files: ["音トレ3段SCENE3_No1.mp3", "音トレ3段SCENE3_Q1.mp3"]},
    { series: "リスニング", title: "Scene4", audio_files: ["音トレ3段SCENE4_No1.mp3", "音トレ3段SCENE4_Q1.mp3"]},
    { series: "リスニング", title: "Scene5", audio_files: ["音トレ3段SCENE5_No1.mp3", "音トレ3段SCENE5_Q1.mp3"]},
    { series: "リスニング", title: "Scene6", audio_files: ["音トレ3段SCENE6_No1.mp3", "音トレ3段SCENE6_Q1.mp3"]},
    { series: "リスニング", title: "Scene7", audio_files: ["音トレ3段SCENE7_No1.mp3", "音トレ3段SCENE7_Q1.mp3"]},
    { series: "リスニング", title: "Scene8", audio_files: ["音トレ3段SCENE8_No1.mp3", "音トレ3段SCENE8_Q1.mp3"]},
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
    { series: "リスニング", title: "Scene1", audio_files: ["音トレ2段SCENE1_No1.mp3", "音トレ2段SCENE1_Q1.mp3"]},
    { series: "リスニング", title: "Scene2", audio_files: ["音トレ2段SCENE2_No1.mp3", "音トレ2段SCENE2_Q1.mp3"]},
    { series: "リスニング", title: "Scene3", audio_files: ["音トレ2段SCENE3_No1.mp3", "音トレ2段SCENE3_Q1.mp3"]},
    { series: "リスニング", title: "Scene4", audio_files: ["音トレ2段SCENE4_No1.mp3", "音トレ2段SCENE4_Q1.mp3"]},
    { series: "リスニング", title: "Scene5", audio_files: ["音トレ2段SCENE5_No1.mp3", "音トレ2段SCENE5_Q1.mp3"]},
    { series: "リスニング", title: "Scene6", audio_files: ["音トレ2段SCENE6_No1.mp3", "音トレ2段SCENE6_Q1.mp3"]},
    { series: "リスニング", title: "Scene7", audio_files: ["音トレ2段SCENE7_No1.mp3", "音トレ2段SCENE7_Q1.mp3"]},
    { series: "リスニング", title: "Scene8", audio_files: ["音トレ2段SCENE8_No1.mp3", "音トレ2段SCENE8_Q1.mp3"]},
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
    { series: "リスニング", title: "Scene1", audio_files: ["音トレ初段SCENE1_No1.mp3", "音トレ初段SCENE1_No2.mp3", "音トレ初段SCENE1_No3.mp3", "音トレ初段SCENE1_No4.mp3", "音トレ初段SCENE1_Q1.mp3", "音トレ初段SCENE1_Q2.mp3", "音トレ初段SCENE1_Q3.mp3", "音トレ初段SCENE1_Q4.mp3", "音トレ初段SCENE1_Q5.mp3", "音トレ初段SCENE1_Q6.mp3", "音トレ初段SCENE1_Q7.mp3", "音トレ初段SCENE1_Q8.mp3"]},
    { series: "リスニング", title: "Scene2", audio_files: ["音トレ初段SCENE2_No1.mp3", "音トレ初段SCENE2_No2.mp3", "音トレ初段SCENE2_No3.mp3", "音トレ初段SCENE2_No4.mp3", "音トレ初段SCENE2_Q1.mp3", "音トレ初段SCENE2_Q2.mp3", "音トレ初段SCENE2_Q3.mp3", "音トレ初段SCENE2_Q4.mp3", "音トレ初段SCENE2_Q5.mp3", "音トレ初段SCENE2_Q6.mp3", "音トレ初段SCENE2_Q7.mp3", "音トレ初段SCENE2_Q8.mp3"]},
    { series: "リスニング", title: "Scene3", audio_files: ["音トレ初段SCENE3_No1.mp3", "音トレ初段SCENE3_No2.mp3", "音トレ初段SCENE3_No3.mp3", "音トレ初段SCENE3_No4.mp3", "音トレ初段SCENE3_Q1.mp3", "音トレ初段SCENE3_Q2.mp3", "音トレ初段SCENE3_Q3.mp3", "音トレ初段SCENE3_Q4.mp3", "音トレ初段SCENE3_Q5.mp3", "音トレ初段SCENE3_Q6.mp3", "音トレ初段SCENE3_Q7.mp3", "音トレ初段SCENE3_Q8.mp3"]},
    { series: "リスニング", title: "Scene4", audio_files: ["音トレ初段SCENE4_No1.mp3", "音トレ初段SCENE4_No2.mp3", "音トレ初段SCENE4_No3.mp3", "音トレ初段SCENE4_No4.mp3", "音トレ初段SCENE4_Q1.mp3", "音トレ初段SCENE4_Q2.mp3", "音トレ初段SCENE4_Q3.mp3", "音トレ初段SCENE4_Q4.mp3", "音トレ初段SCENE4_Q5.mp3", "音トレ初段SCENE4_Q6.mp3", "音トレ初段SCENE4_Q7.mp3", "音トレ初段SCENE4_Q8.mp3"]},
    { series: "リスニング", title: "Scene5", audio_files: ["音トレ初段SCENE5_No1.mp3", "音トレ初段SCENE5_No2.mp3", "音トレ初段SCENE5_No3.mp3", "音トレ初段SCENE5_No4.mp3", "音トレ初段SCENE5_Q1.mp3", "音トレ初段SCENE5_Q2.mp3", "音トレ初段SCENE5_Q3.mp3", "音トレ初段SCENE5_Q4.mp3", "音トレ初段SCENE5_Q5.mp3", "音トレ初段SCENE5_Q6.mp3", "音トレ初段SCENE5_Q7.mp3", "音トレ初段SCENE5_Q8.mp3"]},
]

  create_chapters_for("音トレ道場初段", chapters_data1)

end