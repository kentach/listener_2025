puts "🔧 Fixing PostgreSQL sequences..."

ActiveRecord::Base.transaction do
  # 既存のVocabularyを削除
  Vocabulary.delete_all

  actions_3kyu = [
  { number: 1, english: "shine", japanese: "輝く" },
  { number: 2, english: "continue", japanese: "続ける" },
  { number: 3, english: "escape", japanese: "逃げる" },
  { number: 4, english: "master", japanese: "習得する、極める" },
  { number: 5, english: "pick", japanese: "選ぶ、摘む" },
  { number: 6, english: "hunt", japanese: "狩る" },
  { number: 7, english: "press", japanese: "押す" },
  { number: 8, english: "guess", japanese: "推測する、思う" },
  { number: 9, english: "damage", japanese: "損害を与える" },
  { number: 10, english: "marry", japanese: "結婚する" },
  { number: 11, english: "cancel", japanese: "取り消す" },
  { number: 12, english: "blow", japanese: "（風が）吹く" },
  { number: 13, english: "relax", japanese: "くつろぐ" },
  { number: 14, english: "offer", japanese: "提供する、勧める" },
  { number: 15, english: "collect", japanese: "集める" },
  { number: 16, english: "lead", japanese: "導く、先導する" },
  { number: 17, english: "hide", japanese: "隠す" },
  { number: 18, english: "trust", japanese: "信頼する、信用する" },
  { number: 19, english: "agree", japanese: "賛成する" },
  { number: 20, english: "exchange", japanese: "交換する" },
  { number: 21, english: "shock", japanese: "衝撃を与える" },
  { number: 22, english: "introduce", japanese: "紹介する" },
  { number: 23, english: "join", japanese: "加わる、参加する" },
  { number: 24, english: "state", japanese: "述べる" },
  { number: 25, english: "pass", japanese: "過ぎる、合格する" },
  { number: 26, english: "stew", japanese: "煮込む" },
  { number: 27, english: "attend", japanese: "出席する" },
  { number: 28, english: "believe", japanese: "信じる" },
  { number: 29, english: "hate", japanese: "嫌う、憎む" },
  { number: 30, english: "rise", japanese: "昇る、増大する" },
  { number: 31, english: "act", japanese: "行動する、演じる" },
  { number: 32, english: "bake", japanese: "焼く" },
  { number: 33, english: "shoot", japanese: "撃つ、シュートする" },
  { number: 34, english: "waste", japanese: "むだにする" },
  { number: 35, english: "invite", japanese: "招待する" },
  { number: 36, english: "wish", japanese: "望む、願う" },
  { number: 37, english: "travel", japanese: "旅行する" },
  { number: 38, english: "wave", japanese: "（手・旗などを）振る" },
  { number: 39, english: "hurt", japanese: "傷つける、痛む" },
  { number: 40, english: "taste", japanese: "味がする" },
  { number: 41, english: "perform", japanese: "演じる、演奏する" },
  { number: 42, english: "decide", japanese: "決める" },
  { number: 43, english: "twist", japanese: "ねじる、ひねる、曲げる" },
  { number: 44, english: "board", japanese: "（船・飛行機・列車に）乗る" },
  { number: 45, english: "graduate", japanese: "卒業する" },
  { number: 46, english: "sound", japanese: "聞こえる、音がする" },
  { number: 47, english: "check", japanese: "照合する、確認する、調べる" },
  { number: 48, english: "prepare", japanese: "準備する" },
  { number: 49, english: "advise", japanese: "忠告する、助言する" },
  { number: 50, english: "add", japanese: "加える" },
  { number: 51, english: "cross", japanese: "横切る" },
  { number: 52, english: "mark", japanese: "マークをつける" },
  { number: 53, english: "solve", japanese: "解く、解決する" },
  { number: 54, english: "raise", japanese: "上げる［挙げる］、育てる" },
  { number: 55, english: "miss", japanese: "いないので寂しく思う、乗り遅れる" },
  { number: 56, english: "smoke", japanese: "たばこを吸う" },
  { number: 57, english: "die", japanese: "死ぬ" },
  { number: 58, english: "sign", japanese: "署名する、合図する" },
  { number: 59, english: "lend", japanese: "貸す" },
  { number: 60, english: "fit", japanese: "（サイズなどが）合う" },
  { number: 61, english: "happen", japanese: "起こる" },
  { number: 62, english: "celebrate", japanese: "祝う" },
  { number: 63, english: "forgive", japanese: "許す" },
  { number: 64, english: "smell", japanese: "においがする" },
  { number: 65, english: "cheer", japanese: "元気づける" },
  { number: 66, english: "hold", japanese: "支える、手に持つ、（会・式を）開催する" },
  { number: 67, english: "support", japanese: "支持する、支援する" },
  { number: 68, english: "explain", japanese: "説明する" },
  { number: 69, english: "climb", japanese: "登る" },
  { number: 70, english: "burn", japanese: "燃える、燃やす" },
  { number: 71, english: "plant", japanese: "植える" },
  { number: 72, english: "fear", japanese: "恐れる" },
  { number: 73, english: "choose", japanese: "選ぶ" },
  { number: 74, english: "touch", japanese: "さわる" },
  { number: 75, english: "borrow", japanese: "借りる" },
  { number: 76, english: "boil", japanese: "沸かす、ゆでる" },
  { number: 77, english: "receive", japanese: "受け取る" },
  { number: 78, english: "greet", japanese: "あいさつする、出迎える" },
  { number: 79, english: "pull", japanese: "引っぱる" },
  { number: 80, english: "save", japanese: "救う、たくわえる、節約する" },
  { number: 81, english: "cost", japanese: "費用がかかる" },
  { number: 82, english: "follow", japanese: "後についていく、従う" },
  { number: 83, english: "fix", japanese: "修理する、決定する" },
  { number: 84, english: "fold", japanese: "折る、たたむ" },
  { number: 85, english: "decorate", japanese: "飾る" },
  { number: 86, english: "release", japanese: "解放する、公開する、発表する" },
  { number: 87, english: "feed", japanese: "食物を与える" },
  { number: 88, english: "spread", japanese: "広げる、伸ばす、広がる" },
  { number: 89, english: "remember", japanese: "覚えている、思い出す" },
  { number: 90, english: "order", japanese: "注文する" },
  { number: 91, english: "deliver", japanese: "配達する" },
  { number: 92, english: "wear", japanese: "身につけている" },
  { number: 93, english: "share", japanese: "共有する、共用する" },
  { number: 94, english: "steal", japanese: "盗む" },
  { number: 95, english: "roast", japanese: "焼く" }
]

actions_3kyu.each do |w|
  Vocabulary.create!(
    number: w[:number],
    english: w[:english],
    japanese: w[:japanese],
    series: "動詞（規則動詞・不規則動詞）",
    level: "3級"
  )
end

adjectives_3kyu = [
  { number: 1, english: "right", japanese: "正しい" },
  { number: 2, english: "impossible", japanese: "不可能な" },
  { number: 3, english: "tight", japanese: "きつい、ぴんと張った" },
  { number: 4, english: "crowded", japanese: "混雑した" },
  { number: 5, english: "shy", japanese: "内気な、恥ずかしがりの" },
  { number: 6, english: "total", japanese: "全部の、総計の、全くの" },
  { number: 7, english: "rude", japanese: "不作法な、無礼な" },
  { number: 8, english: "foolish", japanese: "ばかげた" },
  { number: 9, english: "thirsty", japanese: "のどのかわいた" },
  { number: 10, english: "boring", japanese: "退屈な" },
  { number: 11, english: "official", japanese: "公式の" },
  { number: 12, english: "common", japanese: "普通の、共通の" },
  { number: 13, english: "familiar", japanese: "見慣れた、聞き慣れた、よく知っている、親しい" },
  { number: 14, english: "nervous", japanese: "緊張した" },
  { number: 15, english: "expensive", japanese: "高価な" },
  { number: 16, english: "smart", japanese: "利口な" },
  { number: 17, english: "several", japanese: "いくつかの" },
  { number: 18, english: "alive", japanese: "生きている" },
  { number: 19, english: "cheap", japanese: "安い" },
  { number: 20, english: "international", japanese: "国際的な" },
  { number: 21, english: "enough", japanese: "十分な" },
  { number: 22, english: "public", japanese: "公共の" },
  { number: 23, english: "necessary", japanese: "必要な" },
  { number: 24, english: "possible", japanese: "可能な" },
  { number: 25, english: "serious", japanese: "重大な、真面目な、真剣な" },
  { number: 26, english: "basic", japanese: "基本的な" },
  { number: 27, english: "comfortable", japanese: "快適な、心地よい" },
  { number: 28, english: "free", japanese: "無料の、暇な" },
  { number: 29, english: "popular", japanese: "人気のある" },
  { number: 30, english: "famous", japanese: "有名な" },
  { number: 31, english: "foreign", japanese: "外国の" },
  { number: 32, english: "fresh", japanese: "新鮮な" },
  { number: 33, english: "amazing", japanese: "驚くべき、すごい" },
  { number: 34, english: "crazy", japanese: "頭がおかしい、熱狂した" },
  { number: 35, english: "past", japanese: "過去の、過ぎ去った" },
  { number: 36, english: "local", japanese: "地元の" },
  { number: 37, english: "extra", japanese: "余分な、追加の" },
  { number: 38, english: "correct", japanese: "正しい" },
  { number: 39, english: "bright", japanese: "輝いている、鮮やかな、利口な" },
  { number: 40, english: "dead", japanese: "死んでいる" },
  { number: 41, english: "own", japanese: "自分自身の" },
  { number: 42, english: "terrible", japanese: "ひどい、ひどく悪い" },
  { number: 43, english: "tasty", japanese: "おいしい" },
  { number: 44, english: "absent", japanese: "欠席した" },
  { number: 45, english: "wrong", japanese: "間違った" },
  { number: 46, english: "major", japanese: "大きい方の、主要な" },
  { number: 47, english: "each", japanese: "それぞれの" },
  { number: 48, english: "excellent", japanese: "すぐれた、すばらしい" },
  { number: 49, english: "normal", japanese: "標準の、普通の、通常の" },
  { number: 50, english: "surprised", japanese: "驚いた" },
  { number: 51, english: "lazy", japanese: "怠けた、怠け者の" },
  { number: 52, english: "polite", japanese: "礼儀正しい" },
  { number: 53, english: "same", japanese: "同じ" },
  { number: 54, english: "lonely", japanese: "ひとりぼっちの、寂しい" },
  { number: 55, english: "fair", japanese: "公正な、公平な" },
  { number: 56, english: "electric", japanese: "電気の" },
  { number: 57, english: "elderly", japanese: "年配の" },
  { number: 58, english: "loud", japanese: "（声・音が）大きい" },
  { number: 59, english: "pop", japanese: "ポピュラーな" },
  { number: 60, english: "useful", japanese: "役に立つ" },
  { number: 61, english: "full", japanese: "いっぱいの、満腹で" },
  { number: 62, english: "fat", japanese: "太った" },
  { number: 63, english: "private", japanese: "私的な、個人の" },
  { number: 64, english: "narrow", japanese: "（幅が）せまい" },
  { number: 65, english: "helpful", japanese: "助けになる、役に立つ" },
  { number: 66, english: "healthy", japanese: "健康的な" },
  { number: 67, english: "low", japanese: "低い" },
  { number: 68, english: "important", japanese: "重要な" },
  { number: 69, english: "natural", japanese: "自然の" },
  { number: 70, english: "afraid", japanese: "怖がって" }
]

adjectives_3kyu.each do |w|
  Vocabulary.create!(
    number: w[:number],
    english: w[:english],
    japanese: w[:japanese],
    series: "形容詞",
    level: "3級"
  )
end

adv_prepositions_3kyu = [
  { number: 1, english: "actually", japanese: "実のところ、実際に" },
  { number: 2, english: "exactly", japanese: "正確に、ぴったり、そのとおり" },
  { number: 3, english: "softly", japanese: "やわらかく、そっと" },
  { number: 4, english: "both", japanese: "両方とも" },
  { number: 5, english: "overseas", japanese: "海外へ、海外で" },
  { number: 6, english: "together", japanese: "一緒に" },
  { number: 7, english: "friendly", japanese: "親しい、友好的な" },
  { number: 8, english: "finally", japanese: "ついに、最後に" },
  { number: 9, english: "nearly", japanese: "ほとんど、もう少しで、ほぼ" },
  { number: 10, english: "recently", japanese: "最近" },
  { number: 11, english: "carefully", japanese: "注意深く" },
  { number: 12, english: "abroad", japanese: "海外へ" },
  { number: 13, english: "outdoors", japanese: "屋外で、屋外へ" },
  { number: 14, english: "upstairs", japanese: "上の階へ、上の階に、上の階で" },
  { number: 15, english: "badly", japanese: "悪く、ひどく" },
  { number: 16, english: "downtown", japanese: "繁華街へ、都心へ" },
  { number: 17, english: "instead", japanese: "その代わりに" },
  { number: 18, english: "easily", japanese: "簡単に" },
  { number: 19, english: "straight", japanese: "まっすぐに" },
  { number: 20, english: "almost", japanese: "ほとんど" },
  { number: 21, english: "aloud", japanese: "声を出して" },
  { number: 22, english: "anyway", japanese: "とにかく" },
  { number: 23, english: "nowadays", japanese: "この頃は" },
  { number: 24, english: "rather", japanese: "かなり、（～よりは）むしろ" },
  { number: 25, english: "especially", japanese: "特に" },
  { number: 26, english: "onto", japanese: "～の上に、～の上へ" },
  { number: 27, english: "beside", japanese: "～のそばに、～のそばの" },
  { number: 28, english: "between", japanese: "～の間に、～の間で" },
  { number: 29, english: "across", japanese: "～を横切って" },
  { number: 30, english: "during", japanese: "～の間中（ずっと）" },
  { number: 31, english: "against", japanese: "～に反対して" },
  { number: 32, english: "without", japanese: "～なしで" },
  { number: 33, english: "behind", japanese: "～の後ろに" },
  { number: 34, english: "while", japanese: "～している間に" },
  { number: 35, english: "although", japanese: "～だけれども" }
]

adv_prepositions_3kyu.each do |w|
  Vocabulary.create!(
    number: w[:number],
    english: w[:english],
    japanese: w[:japanese],
    series: "副詞・前置詞・接続詞",
    level: "3級"
  )
end

nouns_3kyu = [
  { number: 1, english: "crowd", japanese: "群衆、人ごみ" },
  { number: 2, english: "planet", japanese: "惑星" },
  { number: 3, english: "village", japanese: "村" },
  { number: 4, english: "age", japanese: "年齢" },
  { number: 5, english: "port", japanese: "港" },
  { number: 6, english: "ceiling", japanese: "天井" },
  { number: 7, english: "skill", japanese: "技術、技能" },
  { number: 8, english: "history", japanese: "歴史" },
  { number: 9, english: "trash", japanese: "ごみ" },
  { number: 10, english: "cart", japanese: "手押し車、カート" },
  { number: 11, english: "shadow", japanese: "影" },
  { number: 12, english: "closet", japanese: "収納室、押し入れ、戸棚" },
  { number: 13, english: "branch", japanese: "枝、支店" },
  { number: 14, english: "section", japanese: "部門、地区" },
  { number: 15, english: "platform", japanese: "（プラット）ホーム" },
  { number: 16, english: "cave", japanese: "洞くつ、ほら穴" },
  { number: 17, english: "item", japanese: "項目、品目、記事" },
  { number: 18, english: "tournament", japanese: "試合、トーナメント" },
  { number: 19, english: "manager", japanese: "支配人" },
  { number: 20, english: "middle", japanese: "真ん中、中央" },
  { number: 21, english: "language", japanese: "言語" },
  { number: 22, english: "nest", japanese: "巣" },
  { number: 23, english: "comb", japanese: "くし" },
  { number: 24, english: "citizen", japanese: "国民、市民" },
  { number: 25, english: "stair(s)", japanese: "階段" },
  { number: 26, english: "hero", japanese: "英雄、主人公" },
  { number: 27, english: "tool", japanese: "道具" },
  { number: 28, english: "vegetable", japanese: "野菜" },
  { number: 29, english: "human", japanese: "人、人間" },
  { number: 30, english: "view", japanese: "意見、ながめ" },
  { number: 31, english: "castle", japanese: "城" },
  { number: 32, english: "shower", japanese: "シャワー、にわか雨" },
  { number: 33, english: "capital", japanese: "首都、資本" },
  { number: 34, english: "shade", japanese: "（日）陰" },
  { number: 35, english: "festival", japanese: "祭り" },
  { number: 36, english: "field", japanese: "野原、畑、競技場" },
  { number: 37, english: "customer", japanese: "客" },
  { number: 38, english: "ladder", japanese: "はしご" },
  { number: 39, english: "apartment", japanese: "アパート" },
  { number: 40, english: "price", japanese: "値段" },
  { number: 41, english: "culture", japanese: "文化" },
  { number: 42, english: "future", japanese: "未来、将来" },
  { number: 43, english: "glove", japanese: "手袋、グローブ" },
  { number: 44, english: "symbol", japanese: "象徴" },
  { number: 45, english: "volunteer", japanese: "ボランティア" },
  { number: 46, english: "emotion", japanese: "感情" },
  { number: 47, english: "airport", japanese: "空港" },
  { number: 48, english: "law", japanese: "法律" },
  { number: 49, english: "entrance", japanese: "入り口" },
  { number: 50, english: "accident", japanese: "事故" },
  { number: 51, english: "nature", japanese: "自然" },
  { number: 52, english: "twin", japanese: "双子（の１人）" },
  { number: 53, english: "cage", japanese: "鳥かご、おり" },
  { number: 54, english: "seed", japanese: "種" },
  { number: 55, english: "courage", japanese: "勇気" },
  { number: 56, english: "mirror", japanese: "鏡" },
  { number: 57, english: "reason", japanese: "理由" },
  { number: 58, english: "headache", japanese: "頭痛" },
  { number: 59, english: "nephew", japanese: "おい" },
  { number: 60, english: "custom", japanese: "慣習、習慣" },
  { number: 61, english: "flavor", japanese: "風味、味" },
  { number: 62, english: "gate", japanese: "門" },
  { number: 63, english: "information", japanese: "情報" },
  { number: 64, english: "sunrise", japanese: "日の出" },
  { number: 65, english: "gesture", japanese: "身ぶり" },
  { number: 66, english: "job", japanese: "仕事" },
  { number: 67, english: "sweater", japanese: "セーター" },
  { number: 68, english: "dictionary", japanese: "辞書" },
  { number: 69, english: "forest", japanese: "森" },
  { number: 70, english: "generation", japanese: "世代" },
  { number: 71, english: "sunshine", japanese: "日光" },
  { number: 72, english: "case", japanese: "場合、事例" },
  { number: 73, english: "fact", japanese: "事実" },
  { number: 74, english: "climate", japanese: "気候" },
  { number: 75, english: "statue", japanese: "像" },
  { number: 76, english: "figure", japanese: "数字、図、姿" },
  { number: 77, english: "gas", japanese: "気体、ガス、ガソリン" },
  { number: 78, english: "storm", japanese: "嵐" },
  { number: 79, english: "subject", japanese: "教科" },
  { number: 80, english: "notice", japanese: "知らせ、注目" },
  { number: 81, english: "boss", japanese: "上司" },
  { number: 82, english: "scissors", japanese: "はさみ" },
  { number: 83, english: "league", japanese: "連盟、リーグ" },
  { number: 84, english: "theater", japanese: "劇場、映画館" },
  { number: 85, english: "pan", japanese: "（平）なべ" },
  { number: 86, english: "sign", japanese: "看板、掲示" },
  { number: 87, english: "mayor", japanese: "市長" },
  { number: 88, english: "note", japanese: "短い手紙、メモ" },
  { number: 89, english: "neighbor", japanese: "近所の人、隣人" },
  { number: 90, english: "gym", japanese: "体育館" },
  { number: 91, english: "island", japanese: "島" },
  { number: 92, english: "model", japanese: "模型、型" },
  { number: 93, english: "weather", japanese: "天気" },
  { number: 94, english: "cause", japanese: "原因、理由" },
  { number: 95, english: "shrine", japanese: "聖堂、神社" },
  { number: 96, english: "dust", japanese: "ほこり" },
  { number: 97, english: "coast", japanese: "海岸、沿岸" },
  { number: 98, english: "chopsticks", japanese: "はし" },
  { number: 99, english: "soldier", japanese: "兵士" },
  { number: 100, english: "diet", japanese: "日常の食物、食事、ダイエット" }
]

nouns_3kyu.each do |w|
  Vocabulary.create!(
    number: w[:number],
    english: w[:english],
    japanese: w[:japanese],
    series: "名詞①",
    level: "3級"
  )
end

nouns_3kyu_extra = [
  { number: 1, english: "actor", japanese: "俳優" },
  { number: 2, english: "department", japanese: "部門" },
  { number: 3, english: "highway", japanese: "幹線道路" },
  { number: 4, english: "person", japanese: "人" },
  { number: 5, english: "tradition", japanese: "伝統、しきたり" },
  { number: 6, english: "area", japanese: "地域、区域" },
  { number: 7, english: "refrigerator", japanese: "冷蔵庫" },
  { number: 8, english: "factory", japanese: "工場" },
  { number: 9, english: "heat", japanese: "熱、熱さ［暑さ］" },
  { number: 10, english: "temperature", japanese: "温度、気温、体温" },
  { number: 11, english: "pain", japanese: "痛み" },
  { number: 12, english: "rest", japanese: "休憩" },
  { number: 13, english: "bay", japanese: "湾" },
  { number: 14, english: "schedule", japanese: "予定、時刻表" },
  { number: 15, english: "desert", japanese: "砂漠" },
  { number: 16, english: "garbage", japanese: "（生）ごみ" },
  { number: 17, english: "guide", japanese: "ガイド、ガイドブック" },
  { number: 18, english: "medicine", japanese: "薬" },
  { number: 19, english: "tail", japanese: "尾" },
  { number: 20, english: "experience", japanese: "経験" },
  { number: 21, english: "aquarium", japanese: "水族館" },
  { number: 22, english: "puppy", japanese: "子犬" },
  { number: 23, english: "meal", japanese: "食事" },
  { number: 24, english: "million", japanese: "100万" },
  { number: 25, english: "company", japanese: "会社" },
  { number: 26, english: "garage", japanese: "車庫、ガレージ" },
  { number: 27, english: "grass", japanese: "草、芝生" },
  { number: 28, english: "system", japanese: "体系、方式、制度" },
  { number: 29, english: "adult", japanese: "成人、大人" },
  { number: 30, english: "purse", japanese: "ハンドバッグ、小銭入れ" },
  { number: 31, english: "period", japanese: "期間、（授業の）時限" },
  { number: 32, english: "wallet", japanese: "財布" },
  { number: 33, english: "fever", japanese: "（病気の）熱" },
  { number: 34, english: "promise", japanese: "約束" },
  { number: 35, english: "novel", japanese: "（長編）小説" },
  { number: 36, english: "project", japanese: "計画、事業" },
  { number: 37, english: "hole", japanese: "穴" },
  { number: 38, english: "message", japanese: "伝言" },
  { number: 39, english: "truth", japanese: "真実、本当のこと" },
  { number: 40, english: "bottom", japanese: "底" },
  { number: 41, english: "secret", japanese: "秘密" },
  { number: 42, english: "clothes", japanese: "衣服" },
  { number: 43, english: "government", japanese: "政府" },
  { number: 44, english: "height", japanese: "身長、高さ" },
  { number: 45, english: "thought", japanese: "考え、意見" },
  { number: 46, english: "interview", japanese: "面接" },
  { number: 47, english: "voice", japanese: "声" },
  { number: 48, english: "battle", japanese: "戦い、戦闘" },
  { number: 49, english: "rule", japanese: "規則" },
  { number: 50, english: "audience", japanese: "聴衆、観衆" },
  { number: 51, english: "resort", japanese: "行楽地、リゾート" },
  { number: 52, english: "award", japanese: "賞" },
  { number: 53, english: "role", japanese: "役割" },
  { number: 54, english: "address", japanese: "住所" },
  { number: 55, english: "pleasure", japanese: "楽しみ、喜び" },
  { number: 56, english: "continent", japanese: "大陸" },
  { number: 57, english: "exam", japanese: "試験" },
  { number: 58, english: "leaf", japanese: "（木・草の）葉" },
  { number: 59, english: "advice", japanese: "忠告、助言" },
  { number: 60, english: "recipe", japanese: "調理法、レシピ" },
  { number: 61, english: "earthquake", japanese: "地震" },
  { number: 62, english: "heaven", japanese: "天国" },
  { number: 63, english: "office", japanese: "事務所、オフィス" },
  { number: 64, english: "terminal", japanese: "終点、ターミナル" },
  { number: 65, english: "license", japanese: "免許（証）" },
  { number: 66, english: "wedding", japanese: "結婚式" },
  { number: 67, english: "health", japanese: "健康" },
  { number: 68, english: "prize", japanese: "賞" },
  { number: 69, english: "tear", japanese: "涙" },
  { number: 70, english: "crop", japanese: "作物、農作物" },
  { number: 71, english: "convenience", japanese: "便利、便利な物、便利な設備" },
  { number: 72, english: "court", japanese: "法廷、コート、中庭" },
  { number: 73, english: "niece", japanese: "めい" }
]

nouns_3kyu_extra.each do |w|
  Vocabulary.create!(
    number: w[:number],
    english: w[:english],
    japanese: w[:japanese],
    series: "名詞②",
    level: "3級"
  )
end



vocabularies_4kyu = [
  { number: 1, english: "be (was/were, been)", japanese: "～である・いる" },
  { number: 2, english: "do (did, done)", japanese: "する" },
  { number: 3, english: "eat (ate, eaten)", japanese: "たべる" },
  { number: 4, english: "get (got, got(ten))", japanese: "手に入れる" },
  { number: 5, english: "forget (forgot, forgot(ten))", japanese: "忘れる" },
  { number: 6, english: "go (went, gone)", japanese: "行く" },
  { number: 7, english: "come (came, come)", japanese: "来る" },
  { number: 8, english: "become (became, become)", japanese: "～になる" },
  { number: 9, english: "have (had, had)", japanese: "持っている" },
  { number: 10, english: "find (found, found)", japanese: "見つける" },
  { number: 11, english: "make (made, made)", japanese: "作る" },
  { number: 12, english: "see (saw, seen)", japanese: "見る・会う" },
  { number: 13, english: "hear (heard, heard)", japanese: "聞く" },
  { number: 14, english: "meet (met, met)", japanese: "会う" },
  { number: 15, english: "lose (lost, lost)", japanese: "負ける・なくす" },
  { number: 16, english: "read (read, read)", japanese: "読む" },
  { number: 17, english: "win (won, won)", japanese: "勝つ" },
  { number: 18, english: "cut (cut, cut)", japanese: "切る" },
  { number: 19, english: "shut (shut, shut)", japanese: "閉める" },
  { number: 20, english: "hit (hit, hit)", japanese: "たたく" },
  { number: 21, english: "sing (sang, sung)", japanese: "歌う" },
  { number: 22, english: "drink (drank, drunk)", japanese: "飲む" },
  { number: 23, english: "sit (sat, sat)", japanese: "すわる" },
  { number: 24, english: "swim (swam, swum)", japanese: "泳ぐ" },
  { number: 25, english: "run (ran, run)", japanese: "走る" },
  { number: 26, english: "begin (began, begun)", japanese: "始める・始まる" },
  { number: 27, english: "take (took, taken)", japanese: "取る・持っていく" },
  { number: 28, english: "stand (stood, stood)", japanese: "立つ" },
  { number: 29, english: "understand (understood, understood)", japanese: "理解する" },
  { number: 30, english: "drive (drove, driven)", japanese: "運転する" },
  { number: 31, english: "write (wrote, written)", japanese: "書く" },
  { number: 32, english: "ride (rode, ridden)", japanese: "乗る" },
  { number: 33, english: "break (broke, broken)", japanese: "壊す" },
  { number: 34, english: "speak (spoke, spoken)", japanese: "話す" },
  { number: 35, english: "know (knew, known)", japanese: "知っている" },
  { number: 36, english: "draw (drew, drawn)", japanese: "描く" },
  { number: 37, english: "throw (threw, thrown)", japanese: "なげる" },
  { number: 38, english: "grow (grew, grown)", japanese: "育つ・育てる" },
  { number: 39, english: "fly (flew, flown)", japanese: "飛ぶ" },
  { number: 40, english: "send (sent, sent)", japanese: "送る" },
  { number: 41, english: "spend (spent, spent)", japanese: "過ごす・費やす" },
  { number: 42, english: "build (built, built)", japanese: "建てる" },
  { number: 43, english: "buy (bought, bought)", japanese: "買う" },
  { number: 44, english: "bring (brought, brought)", japanese: "持ってくる" },
  { number: 45, english: "think (thought, thought)", japanese: "思う・考える" },
  { number: 46, english: "catch (caught, caught)", japanese: "つかまえる" },
  { number: 47, english: "teach (taught, taught)", japanese: "教える" },
  { number: 48, english: "say (said, said)", japanese: "～と言う" },
  { number: 49, english: "pay (paid, paid)", japanese: "払う" },
  { number: 50, english: "keep (kept, kept)", japanese: "保つ" },
  { number: 51, english: "sleep (slept, slept)", japanese: "寝る" },
  { number: 52, english: "feel (felt, felt)", japanese: "感じる・気がする" },
  { number: 53, english: "leave (left, left)", japanese: "去る・出発する" },
  { number: 54, english: "tell (told, told)", japanese: "（人に）言う" },
  { number: 55, english: "sell (sold, sold)", japanese: "売る" }
]

vocabularies_4kyu.each do |w|
  Vocabulary.create!(
    number: w[:number],
    english: w[:english],
    japanese: w[:japanese],
    series: "不規則動詞",
    level: "4級"
  )
end

adj_adv_prepositions_4kyu = [
  { number: 1, english: "easy", japanese: "簡単な" },
  { number: 2, english: "difficult", japanese: "難しい" },
  { number: 3, english: "busy", japanese: "忙しい" },
  { number: 4, english: "free", japanese: "無料の、ひまな" },
  { number: 5, english: "thirsty", japanese: "のどがかわいた" },
  { number: 6, english: "popular", japanese: "人気のある" },
  { number: 7, english: "famous", japanese: "有名な" },
  { number: 8, english: "early", japanese: "早い" },
  { number: 9, english: "fast", japanese: "速い" },
  { number: 10, english: "late", japanese: "遅い" },
  { number: 11, english: "strong", japanese: "強い" },
  { number: 12, english: "weak", japanese: "弱い" },
  { number: 13, english: "interesting", japanese: "面白い、興味深い" },
  { number: 14, english: "funny", japanese: "面白い、笑える" },
  { number: 15, english: "exciting", japanese: "ワクワクする" },
  { number: 16, english: "angry", japanese: "怒った" },
  { number: 17, english: "clean", japanese: "きれいな" },
  { number: 18, english: "dirty", japanese: "汚い" },
  { number: 19, english: "better", japanese: "もっと良い" },
  { number: 20, english: "best", japanese: "一番良い" },
  { number: 21, english: "delicious", japanese: "おいしい" },
  { number: 22, english: "fun", japanese: "楽しみ" },
  { number: 23, english: "boring", japanese: "退屈な" },
  { number: 24, english: "sick", japanese: "病気の" },
  { number: 25, english: "healthy", japanese: "健康的な" },
  { number: 26, english: "short", japanese: "短い" },
  { number: 27, english: "beautiful", japanese: "美しい" },
  { number: 28, english: "pretty", japanese: "かわいい" },
  { number: 29, english: "cute", japanese: "かわいい" },
  { number: 30, english: "different", japanese: "異なった" },
  { number: 31, english: "same", japanese: "同じ" },
  { number: 32, english: "rich", japanese: "お金持ちの" },
  { number: 33, english: "poor", japanese: "貧しい" },
  { number: 34, english: "hungry", japanese: "空腹の" },
  { number: 35, english: "full", japanese: "いっぱいの" },
  { number: 36, english: "useful", japanese: "役立つ" },
  { number: 37, english: "right", japanese: "正しい、右の" },
  { number: 38, english: "left", japanese: "左の" },
  { number: 39, english: "ready", japanese: "準備のできた" },
  { number: 40, english: "behind", japanese: "～の後ろに" },
  { number: 41, english: "front", japanese: "正面の" },
  { number: 42, english: "around", japanese: "～のあたり" },
  { number: 43, english: "tired", japanese: "疲れた" },
  { number: 44, english: "dangerous", japanese: "危険な" },
  { number: 45, english: "near", japanese: "～の近くに" },
  { number: 46, english: "away", japanese: "離れて" },
  { number: 47, english: "between", japanese: "～と・・・の間" },
  { number: 48, english: "favorite", japanese: "大好きな" },
  { number: 49, english: "because", japanese: "～なので" },
  { number: 50, english: "young", japanese: "若い" },
  { number: 51, english: "kind", japanese: "親切な" },
  { number: 52, english: "hard", japanese: "一生懸命、大変" },
  { number: 53, english: "wrong", japanese: "間違った" },
  { number: 54, english: "careful", japanese: "注意深い" },
  { number: 55, english: "quiet", japanese: "静かな" },
  { number: 56, english: "together", japanese: "いっしょに" },
  { number: 57, english: "sometimes", japanese: "時々" },
  { number: 58, english: "often", japanese: "よく" },
  { number: 59, english: "usually", japanese: "ふつう" },
  { number: 60, english: "always", japanese: "いつも" }
]

adj_adv_prepositions_4kyu.each do |w|
  Vocabulary.create!(
    number: w[:number],
    english: w[:english],
    japanese: w[:japanese],
    series: "形容詞・副詞・前置詞",
    level: "4級"
  )
end

school_nouns_4kyu = [
  { number: 1, english: "subject", japanese: "科目" },
  { number: 2, english: "Japanese", japanese: "国語" },
  { number: 3, english: "math", japanese: "数学" },
  { number: 4, english: "history", japanese: "歴史" },
  { number: 5, english: "social studies", japanese: "社会" },
  { number: 6, english: "science", japanese: "理科" },
  { number: 7, english: "P.E.", japanese: "体育" },
  { number: 8, english: "art", japanese: "美術" },
  { number: 9, english: "dictionary", japanese: "辞書" },
  { number: 10, english: "elementary school", japanese: "小学校" },
  { number: 11, english: "junior high school", japanese: "中学校" },
  { number: 12, english: "high school", japanese: "高校" },
  { number: 13, english: "college", japanese: "大学" },
  { number: 14, english: "gym", japanese: "体育館" },
  { number: 15, english: "test", japanese: "テスト" },
  { number: 16, english: "examination", japanese: "試験" },
  { number: 17, english: "problem", japanese: "問題" },
  { number: 18, english: "question", japanese: "質問" },
  { number: 19, english: "answer", japanese: "答え" },
  { number: 20, english: "report", japanese: "レポート" },
  { number: 21, english: "eraser", japanese: "消しゴム" },
  { number: 22, english: "lesson", japanese: "レッスン" },
  { number: 23, english: "uniform", japanese: "制服、ユニフォーム" },
  { number: 24, english: "language", japanese: "言葉" }
]

school_nouns_4kyu.each do |w|
  Vocabulary.create!(
    number: w[:number],
    english: w[:english],
    japanese: w[:japanese],
    series: "科目 / 学校 / 勉強",
    level: "4級"
  )
end

places_4kyu = [
  { number: 1, english: "apartment", japanese: "アパート" },
  { number: 2, english: "kitchen", japanese: "台所" },
  { number: 3, english: "bathroom", japanese: "トイレ、お風呂" },
  { number: 4, english: "living room", japanese: "居間" },
  { number: 5, english: "bedroom", japanese: "寝室" },
  { number: 6, english: "yard", japanese: "庭" },
  { number: 7, english: "supermarket", japanese: "スーパー" },
  { number: 8, english: "stadium", japanese: "スタジアム" },
  { number: 9, english: "airport", japanese: "空港" },
  { number: 10, english: "hospital", japanese: "病院" },
  { number: 11, english: "dentist", japanese: "歯医者" },
  { number: 12, english: "museum", japanese: "美術館" },
  { number: 13, english: "library", japanese: "図書館" },
  { number: 14, english: "bank", japanese: "銀行" },
  { number: 15, english: "farm", japanese: "農場" },
  { number: 16, english: "bookstore", japanese: "本屋" },
  { number: 17, english: "office", japanese: "会社" },
  { number: 18, english: "bridge", japanese: "橋" },
  { number: 19, english: "department store", japanese: "デパート" },
  { number: 20, english: "gas station", japanese: "ガソリンスタンド" },
  { number: 21, english: "restaurant", japanese: "レストラン" },
  { number: 22, english: "post office", japanese: "郵便局" },
  { number: 23, english: "theater", japanese: "映画館" },
  { number: 24, english: "place", japanese: "場所" },
  { number: 25, english: "hometown", japanese: "故郷" },
  { number: 26, english: "city", japanese: "市" },
  { number: 27, english: "town", japanese: "町" },
  { number: 28, english: "village", japanese: "村" }
]

places_4kyu.each do |w|
  Vocabulary.create!(
    number: w[:number],
    english: w[:english],
    japanese: w[:japanese],
    series: "建物・場所",
    level: "4級"
  )
end

family_4kyu = [
  { number: 1, english: "family", japanese: "家族" },
  { number: 2, english: "parents", japanese: "両親" },
  { number: 3, english: "daughter", japanese: "娘" },
  { number: 4, english: "son", japanese: "息子" },
  { number: 5, english: "child", japanese: "子供" },
  { number: 6, english: "children", japanese: "子供たち" },
  { number: 7, english: "aunt", japanese: "おば" },
  { number: 8, english: "uncle", japanese: "おじ" },
  { number: 9, english: "twins", japanese: "双子" },
  { number: 10, english: "grandparents", japanese: "祖父母" },
  { number: 11, english: "grandmother", japanese: "祖母" },
  { number: 12, english: "grandfather", japanese: "祖父" },
  { number: 13, english: "cousin", japanese: "いとこ" },
  { number: 14, english: "nephew", japanese: "おい" },
  { number: 15, english: "niece", japanese: "めい" },
  { number: 16, english: "woman", japanese: "女性" },
  { number: 17, english: "man", japanese: "男性" },
  { number: 18, english: "people", japanese: "人々" },
  { number: 19, english: "lady", japanese: "女性" },
  { number: 20, english: "gentleman", japanese: "紳士" }
]

family_4kyu.each do |w|
  Vocabulary.create!(
    number: w[:number],
    english: w[:english],
    japanese: w[:japanese],
    series: "家族 / 人間",
    level: "4級"
  )
end

jobs_4kyu = [
  { number: 1, english: "doctor", japanese: "医者" },
  { number: 2, english: "nurse", japanese: "看護師" },
  { number: 3, english: "pilot", japanese: "パイロット" },
  { number: 4, english: "teacher", japanese: "先生" },
  { number: 5, english: "cook", japanese: "調理師" },
  { number: 6, english: "farmer", japanese: "農家" },
  { number: 7, english: "police officer", japanese: "警察官" },
  { number: 8, english: "firefighter", japanese: "消防士" },
  { number: 9, english: "driver", japanese: "運転手" },
  { number: 10, english: "scientist", japanese: "科学者" },
  { number: 11, english: "singer", japanese: "歌手" },
  { number: 12, english: "actor", japanese: "俳優" },
  { number: 13, english: "actress", japanese: "女優" },
  { number: 14, english: "model", japanese: "モデル" },
  { number: 15, english: "barber", japanese: "床屋" },
  { number: 16, english: "designer", japanese: "デザイナー" }
]

jobs_4kyu.each do |w|
  Vocabulary.create!(
    number: w[:number],
    english: w[:english],
    japanese: w[:japanese],
    series: "職業",
    level: "4級"
  )
end

nature_time_4kyu = [
  { number: 1, english: "star", japanese: "星" },
  { number: 2, english: "wind", japanese: "風" },
  { number: 3, english: "sky", japanese: "空" },
  { number: 4, english: "desert", japanese: "砂漠" },
  { number: 5, english: "lake", japanese: "湖" },
  { number: 6, english: "river", japanese: "川" },
  { number: 7, english: "sea", japanese: "海" },
  { number: 8, english: "country", japanese: "国" },
  { number: 9, english: "season", japanese: "季節" },
  { number: 10, english: "spring", japanese: "春" },
  { number: 11, english: "summer", japanese: "夏" },
  { number: 12, english: "autumn", japanese: "秋" },
  { number: 13, english: "fall", japanese: "秋" },
  { number: 14, english: "winter", japanese: "冬" },
  { number: 15, english: "beach", japanese: "海岸" },
  { number: 16, english: "weather", japanese: "天気" },
  { number: 17, english: "minute", japanese: "分" },
  { number: 18, english: "hour", japanese: "時間" },
  { number: 19, english: "day", japanese: "日" },
  { number: 20, english: "week", japanese: "週" },
  { number: 21, english: "month", japanese: "月" },
  { number: 22, english: "year", japanese: "年" },
  { number: 23, english: "morning", japanese: "朝、午前中" },
  { number: 24, english: "night", japanese: "夜" },
  { number: 25, english: "tonight", japanese: "今夜" },
  { number: 26, english: "weekend", japanese: "週末" },
  { number: 27, english: "yesterday", japanese: "昨日" },
  { number: 28, english: "tomorrow", japanese: "明日" },
  { number: 29, english: "date", japanese: "日付" },
  { number: 30, english: "future", japanese: "将来" },
  { number: 31, english: "vacation", japanese: "休み" },
  { number: 32, english: "holiday", japanese: "休み" }
]

nature_time_4kyu.each do |w|
  Vocabulary.create!(
    number: w[:number],
    english: w[:english],
    japanese: w[:japanese],
    series: "自然 / 時間",
    level: "4級"
  )
end

objects_4kyu = [
  { number: 1, english: "clothes", japanese: "衣服" },
  { number: 2, english: "shoes", japanese: "くつ" },
  { number: 3, english: "coat", japanese: "コート" },
  { number: 4, english: "shirt", japanese: "シャツ" },
  { number: 5, english: "face", japanese: "顔" },
  { number: 6, english: "tooth", japanese: "歯" },
  { number: 7, english: "head", japanese: "頭" },
  { number: 8, english: "movie", japanese: "映画" },
  { number: 9, english: "seat", japanese: "席" },
  { number: 10, english: "present", japanese: "プレゼント" },
  { number: 11, english: "something", japanese: "何か" },
  { number: 12, english: "anything", japanese: "何か（否定・疑問）" },
  { number: 13, english: "nothing", japanese: "何も～ない" },
  { number: 14, english: "thing", japanese: "もの" },
  { number: 15, english: "money", japanese: "お金" },
  { number: 16, english: "computer", japanese: "コンピュータ" },
  { number: 17, english: "picture", japanese: "絵／写真" },
  { number: 18, english: "festival", japanese: "祭り" },
  { number: 19, english: "corner", japanese: "角" },
  { number: 20, english: "meeting", japanese: "会議" },
  { number: 21, english: "example", japanese: "例" },
  { number: 22, english: "practice", japanese: "練習" },
  { number: 23, english: "world", japanese: "世界" },
  { number: 24, english: "dish", japanese: "皿、料理" },
  { number: 25, english: "breakfast", japanese: "朝食" },
  { number: 26, english: "lunch", japanese: "昼食" },
  { number: 27, english: "dinner", japanese: "夕食" },
  { number: 28, english: "idea", japanese: "考え" },
  { number: 29, english: "pants", japanese: "ズボン" },
  { number: 30, english: "everyone", japanese: "みんな" },
  { number: 31, english: "address", japanese: "住所" },
  { number: 32, english: "magazine", japanese: "雑誌" },
  { number: 33, english: "airplane", japanese: "飛行機" },
  { number: 34, english: "group", japanese: "グループ" },
  { number: 35, english: "story", japanese: "物語" },
  { number: 36, english: "contest", japanese: "コンテスト" },
  { number: 37, english: "trip", japanese: "旅行" },
  { number: 38, english: "dream", japanese: "夢" },
  { number: 39, english: "bread", japanese: "パン" },
  { number: 40, english: "rice", japanese: "米" },
  { number: 41, english: "concert", japanese: "コンサート" },
  { number: 42, english: "ticket", japanese: "チケット" },
  { number: 43, english: "hotel", japanese: "ホテル" },
  { number: 44, english: "telephone", japanese: "電話" },
  { number: 45, english: "sound", japanese: "音" },
  { number: 46, english: "culture", japanese: "文化" },
  { number: 47, english: "also", japanese: "～も" },
  { number: 48, english: "soon", japanese: "すぐに" },
  { number: 49, english: "about", japanese: "～について／約" },
  { number: 50, english: "floor", japanese: "階、床" },
  { number: 51, english: "notice", japanese: "お知らせ" },
  { number: 52, english: "member", japanese: "メンバー・一員" }
]

objects_4kyu.each do |w|
  Vocabulary.create!(
    number: w[:number],
    english: w[:english],
    japanese: w[:japanese],
    series: "その他",
    level: "4級"
  )
end

adj_adv_prepositions = [
  { number: 1, english: "new", japanese: "新しい" },
  { number: 2, english: "old", japanese: "古い" },
  { number: 3, english: "big", japanese: "大きい" },
  { number: 4, english: "large", japanese: "大きい、広い" },
  { number: 5, english: "small", japanese: "小さい" },
  { number: 6, english: "fast", japanese: "速い" },
  { number: 7, english: "early", japanese: "早い" },
  { number: 8, english: "slow", japanese: "遅い" },
  { number: 9, english: "long", japanese: "長い" },
  { number: 10, english: "short", japanese: "短い" },
  { number: 11, english: "happy", japanese: "うれしい" },
  { number: 12, english: "sad", japanese: "悲しい" },
  { number: 13, english: "angry", japanese: "怒った" },
  { number: 14, english: "tired", japanese: "疲れた" },
  { number: 15, english: "good", japanese: "よい" },
  { number: 16, english: "nice", japanese: "すてきな" },
  { number: 17, english: "bad", japanese: "悪い" },
  { number: 18, english: "many", japanese: "たくさんの（数）" },
  { number: 19, english: "much", japanese: "たくさんの（量）" },
  { number: 20, english: "beautiful", japanese: "美しい" },
  { number: 21, english: "great", japanese: "すばらしい" },
  { number: 22, english: "sweet", japanese: "甘い" },
  { number: 23, english: "right", japanese: "右の" },
  { number: 24, english: "left", japanese: "左の" },
  { number: 25, english: "very", japanese: "とても" },
  { number: 26, english: "well", japanese: "上手に" },
  { number: 27, english: "cute", japanese: "かわいい" },
  { number: 28, english: "pretty", japanese: "かわいい" },
  { number: 29, english: "in", japanese: "～の中" },
  { number: 30, english: "on", japanese: "～の上" },
  { number: 31, english: "under", japanese: "～の下" },
  { number: 32, english: "by", japanese: "～のそば、～によって" },
  { number: 33, english: "at", japanese: "～に、～で" },
  { number: 34, english: "after", japanese: "～の後" },
  { number: 35, english: "before", japanese: "～の前" },
  { number: 36, english: "but", japanese: "でも" },
  { number: 37, english: "near", japanese: "～の近く" },
  { number: 38, english: "about", japanese: "約、～について" },
  { number: 39, english: "or", japanese: "～か…" },
  { number: 40, english: "and", japanese: "～と…" }
]

adj_adv_prepositions.each do |w|
  Vocabulary.create!(
    number: w[:number],
    english: w[:english],
    japanese: w[:japanese],
    series: "形容詞・副詞・前置詞",
    level: "5級"
  )
end

other_nouns = [
  { number: 1, english: "flower", japanese: "花" },
  { number: 2, english: "tree", japanese: "木" },
  { number: 3, english: "sky", japanese: "空" },
  { number: 4, english: "window", japanese: "窓" },
  { number: 5, english: "door", japanese: "ドア" },
  { number: 6, english: "newspaper", japanese: "新聞" },
  { number: 7, english: "table", japanese: "テーブル" },
  { number: 8, english: "umbrella", japanese: "傘" },
  { number: 9, english: "book", japanese: "本" },
  { number: 10, english: "chair", japanese: "いす" },
  { number: 11, english: "blackboard", japanese: "黒板" },
  { number: 12, english: "notebook", japanese: "ノート" },
  { number: 13, english: "pencil", japanese: "鉛筆" },
  { number: 14, english: "eraser", japanese: "消しゴム" },
  { number: 15, english: "ruler", japanese: "定規" },
  { number: 16, english: "wall", japanese: "壁" },
  { number: 17, english: "cap", japanese: "帽子" },
  { number: 18, english: "cup", japanese: "カップ" },
  { number: 19, english: "glass", japanese: "コップ" },
  { number: 20, english: "shirt", japanese: "シャツ" },
  { number: 21, english: "game", japanese: "試合、ゲーム" },
  { number: 22, english: "party", japanese: "パーティー" },
  { number: 23, english: "hair", japanese: "髪" },
  { number: 24, english: "eye", japanese: "目" },
  { number: 25, english: "ear", japanese: "耳" },
  { number: 26, english: "hand", japanese: "手" },
  { number: 27, english: "tea", japanese: "紅茶" },
  { number: 28, english: "coffee", japanese: "コーヒー" },
  { number: 29, english: "juice", japanese: "ジュース" },
  { number: 30, english: "sugar", japanese: "砂糖" },
  { number: 31, english: "salt", japanese: "塩" },
  { number: 32, english: "bag", japanese: "かばん" },
  { number: 33, english: "desk", japanese: "机" },
  { number: 34, english: "computer", japanese: "コンピューター" },
  { number: 35, english: "letter", japanese: "手紙" },
  { number: 36, english: "breakfast", japanese: "朝食" },
  { number: 37, english: "lunch", japanese: "昼食" },
  { number: 38, english: "dinner", japanese: "夕食" }
]

other_nouns.each do |w|
  Vocabulary.create!(
    number: w[:number],
    english: w[:english],
    japanese: w[:japanese],
    series: "その他の名詞",
    level: "5級"
  )
end

important_phrases = [
  { number: 1, english: "after school", japanese: "放課後" },
  { number: 2, english: "over there", japanese: "あそこで" },
  { number: 3, english: "All right.", japanese: "いいですよ。" },
  { number: 4, english: "Of course.", japanese: "もちろん。" },
  { number: 5, english: "Thank you for ～.", japanese: "～をありがとう。" },
  { number: 6, english: "You’re welcome.", japanese: "どういたしまして。" },
  { number: 7, english: "Here you are.", japanese: "はい、どうぞ。" },
  { number: 8, english: "Here it is.", japanese: "はい、どうぞ。" },
  { number: 9, english: "Good morning.", japanese: "おはようございます。" },
  { number: 10, english: "Good night.", japanese: "おやすみなさい。" },
  { number: 11, english: "Have a nice (good) ～.", japanese: "よい～を。" },
  { number: 12, english: "It’s time for ～.", japanese: "～する時間です。" },
  { number: 13, english: "Pass me the ～.", japanese: "～を取ってください。" },
  { number: 14, english: "in the morning", japanese: "朝に、午前中に" },
  { number: 15, english: "in the afternoon", japanese: "午後に" },
  { number: 16, english: "at night", japanese: "夜に" },
  { number: 17, english: "Welcome to ～", japanese: "ようこそ～へ。" },
  { number: 18, english: "Me, too.", japanese: "私も。" },
  { number: 19, english: "You, too.", japanese: "あなたも。" },
  { number: 20, english: "a little", japanese: "少し" },
  { number: 21, english: "a lot of ～", japanese: "たくさんの～" },
  { number: 22, english: "on TV", japanese: "テレビで" },
  { number: 23, english: "by 乗り物", japanese: "乗り物で" },
  { number: 24, english: "It’s mine.", japanese: "私のです。" },
  { number: 25, english: "from A to B", japanese: "AからBまで" },
  { number: 26, english: "late for ～", japanese: "～に遅れる" }
]

important_phrases.each do |w|
  Vocabulary.create!(
    number: w[:number],
    english: w[:english],
    japanese: w[:japanese],
    series: "重要熟語",
    level: "5級"
  )
end

colors = [
  { number: 1, english: "color", japanese: "色" },
  { number: 2, english: "blue", japanese: "青" },
  { number: 3, english: "red", japanese: "赤" },
  { number: 4, english: "yellow", japanese: "黄色" },
  { number: 5, english: "black", japanese: "黒" },
  { number: 6, english: "white", japanese: "白" },
  { number: 7, english: "green", japanese: "緑" },
  { number: 8, english: "pink", japanese: "ピンク" },
  { number: 9, english: "orange", japanese: "オレンジ" },
  { number: 10, english: "purple", japanese: "紫" },
  { number: 11, english: "brown", japanese: "茶色" },
  { number: 12, english: "gray", japanese: "灰色" }
]

colors.each do |c|
  Vocabulary.create!(
    number: c[:number],
    english: c[:english],
    japanese: c[:japanese],
    series: "色",
    level: "5級"
  )
end

animals = [
  { number: 1, english: "animal", japanese: "動物" },
  { number: 2, english: "pet", japanese: "ペット" },
  { number: 3, english: "zoo", japanese: "動物園" },
  { number: 4, english: "dog", japanese: "犬" },
  { number: 5, english: "cat", japanese: "猫" },
  { number: 6, english: "rabbit", japanese: "ウサギ" },
  { number: 7, english: "monkey", japanese: "サル" },
  { number: 8, english: "elephant", japanese: "ゾウ" },
  { number: 9, english: "lion", japanese: "ライオン" },
  { number: 10, english: "tiger", japanese: "トラ" },
  { number: 11, english: "fish", japanese: "魚" },
  { number: 12, english: "bird", japanese: "鳥" }
]

animals.each do |a|
  Vocabulary.create!(
    number: a[:number],
    english: a[:english],
    japanese: a[:japanese],
    series: "動物",
    level: "5級"
  )
end

school_words = [
  { number: 1, english: "school", japanese: "学校" },
  { number: 2, english: "elementary school", japanese: "小学校" },
  { number: 3, english: "junior high school", japanese: "中学校" },
  { number: 4, english: "high school", japanese: "高校" },
  { number: 5, english: "class", japanese: "授業、クラス" },
  { number: 6, english: "classroom", japanese: "教室" },
  { number: 7, english: "teacher", japanese: "先生" },
  { number: 8, english: "student", japanese: "生徒" },
  { number: 9, english: "textbook", japanese: "教科書" },
  { number: 10, english: "club", japanese: "クラブ、部" },
  { number: 11, english: "Japanese", japanese: "国語" },
  { number: 12, english: "math", japanese: "算数（数学）" },
  { number: 13, english: "science", japanese: "理科" },
  { number: 14, english: "social studies", japanese: "社会" },
  { number: 15, english: "English", japanese: "英語" },
  { number: 16, english: "P.E.", japanese: "体育" },
  { number: 17, english: "music", japanese: "音楽" },
  { number: 18, english: "art", japanese: "美術" }
]

school_words.each do |w|
  Vocabulary.create!(
    number: w[:number],
    english: w[:english],
    japanese: w[:japanese],
    series: "学校・科目",
    level: "5級"
  )
end

seasons = [
  { number: 1, english: "season", japanese: "季節" },
  { number: 2, english: "spring", japanese: "春" },
  { number: 3, english: "summer", japanese: "夏" },
  { number: 4, english: "fall", japanese: "秋" },
  { number: 5, english: "autumn", japanese: "秋" },
  { number: 6, english: "winter", japanese: "冬" }
]

seasons.each do |s|
  Vocabulary.create!(
    number: s[:number],
    english: s[:english],
    japanese: s[:japanese],
    series: "季節",
    level: "5級"
  )
end

countries = [
  { number: 1, english: "country", japanese: "国" },
  { number: 2, english: "Japan", japanese: "日本" },
  { number: 3, english: "America", japanese: "アメリカ" },
  { number: 4, english: "England", japanese: "イギリス" },
  { number: 5, english: "China", japanese: "中国" },
  { number: 6, english: "Korea", japanese: "韓国" },
  { number: 7, english: "Australia", japanese: "オーストラリア" },
  { number: 8, english: "Italy", japanese: "イタリア" },
  { number: 9, english: "Canada", japanese: "カナダ" },
  { number: 10, english: "France", japanese: "フランス" },
  { number: 11, english: "Germany", japanese: "ドイツ" },
  { number: 12, english: "New Zealand", japanese: "ニュージーランド" },
  { number: 13, english: "Brazil", japanese: "ブラジル" },
  { number: 14, english: "India", japanese: "インド" }
]

countries.each do |c|
  Vocabulary.create!(
    number: c[:number],
    english: c[:english],
    japanese: c[:japanese],
    series: "国",
    level: "5級"
  )
end

family = [
  { number: 1, english: "family", japanese: "家族" },
  { number: 2, english: "father", japanese: "父" },
  { number: 3, english: "mother", japanese: "母" },
  { number: 4, english: "sister", japanese: "姉妹" },
  { number: 5, english: "brother", japanese: "兄弟" },
  { number: 6, english: "grandfather", japanese: "おじいさん" },
  { number: 7, english: "grandmother", japanese: "おばあさん" },
  { number: 8, english: "son", japanese: "息子" },
  { number: 9, english: "daughter", japanese: "娘" },
  { number: 10, english: "cousin", japanese: "いとこ" },
  { number: 11, english: "uncle", japanese: "おじ" },
  { number: 12, english: "aunt", japanese: "おば" },
  { number: 13, english: "people", japanese: "人々" },
  { number: 14, english: "girl", japanese: "女の子" },
  { number: 15, english: "boy", japanese: "男の子" },
  { number: 16, english: "child", japanese: "こども" },
  { number: 17, english: "children", japanese: "こどもたち" },
  { number: 18, english: "baby", japanese: "赤ちゃん" },
  { number: 19, english: "woman", japanese: "女性" },
  { number: 20, english: "man", japanese: "男性" }
]

family.each do |f|
  Vocabulary.create!(
    number: f[:number],
    english: f[:english],
    japanese: f[:japanese],
    series: "家族・人",
    level: "5級"
  )
end

instruments = [
  { number: 1, english: "piano", japanese: "ピアノ" },
  { number: 2, english: "violin", japanese: "バイオリン" },
  { number: 3, english: "drum", japanese: "ドラム、太鼓" },
  { number: 4, english: "guitar", japanese: "ギター" },
  { number: 5, english: "trumpet", japanese: "トランペット" },
  { number: 6, english: "flute", japanese: "フルート" }
]

instruments.each do |i|
  Vocabulary.create!(
    number: i[:number],
    english: i[:english],
    japanese: i[:japanese],
    series: "楽器",
    level: "5級"
  )
end

food = [
  { number: 1, english: "fruit", japanese: "果物" },
  { number: 2, english: "apple", japanese: "りんご" },
  { number: 3, english: "orange", japanese: "オレンジ" },
  { number: 4, english: "banana", japanese: "バナナ" },
  { number: 5, english: "melon", japanese: "メロン" },
  { number: 6, english: "strawberry", japanese: "イチゴ" },
  { number: 7, english: "cherry", japanese: "サクランボ" },
  { number: 8, english: "pineapple", japanese: "パイナップル" },
  { number: 9, english: "grape", japanese: "ブドウ" },
  { number: 10, english: "peach", japanese: "桃" },
  { number: 11, english: "vegetable", japanese: "野菜" },
  { number: 12, english: "salad", japanese: "サラダ" },
  { number: 13, english: "potato", japanese: "ジャガイモ" },
  { number: 14, english: "carrot", japanese: "人参" },
  { number: 15, english: "onion", japanese: "玉ねぎ" },
  { number: 16, english: "pumpkin", japanese: "カボチャ" },
  { number: 17, english: "cabbage", japanese: "キャベツ" },
  { number: 18, english: "cucumber", japanese: "キュウリ" },
  { number: 19, english: "radish", japanese: "大根" },
  { number: 20, english: "broccoli", japanese: "ブロッコリー" }
]

food.each do |f|
  Vocabulary.create!(
    number: f[:number],
    english: f[:english],
    japanese: f[:japanese],
    series: "果物・野菜",
    level: "5級"
  )
end

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



# ================================
# 全削除（順番重要）
# ================================
Favorite.delete_all
Audio.delete_all
Chapter.delete_all
Textbook.delete_all

# ================================
# IDリセット（PostgreSQL）
# ================================
ActiveRecord::Base.connection.tables.each do |table|
  next if table.in?(%w[schema_migrations ar_internal_metadata])

  ActiveRecord::Base.connection.execute(<<~SQL)
    SELECT setval(
      pg_get_serial_sequence('#{table}', 'id'),
      COALESCE((SELECT MAX(id) FROM #{table}), 1),
      false
    )
  SQL
end

# ================================
# 共通メソッド（create専用）
# ================================
def create_chapters_for(textbook_name, chapters_data)
  textbook = Textbook.find_by!(name: textbook_name)

  chapters_data.each do |c|
    chapter = Chapter.create!(
      textbook_id: textbook.id,
      series: c[:series],
      title: c[:title]
    )

    Array(c[:audio_files]).each do |file|
      Audio.create!(
        chapter_id: chapter.id,
        file_name: file
      )
    end
  end
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
    Textbook.create!(attrs)
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
    { series: "リスニング", title: "Scene1 Situation Dialogues 様々な場面での対話", audio_files: ["音トレ5段SCENE1_No1.mp3", "音トレ5段SCENE1_Q1.mp3"] },
    { series: "リスニング", title: "Scene2 Story Narrations 様々なストーリーのナレーション", audio_files: ["音トレ5段SCENE2_No1.mp3", "音トレ5段 SCENE2_Q1.mp3"] },
    { series: "リスニング", title: "Scene3 Speeches and Announcements 様々なスピーチ・お知らせ", audio_files: ["音トレ5段SCENE3_No1.mp3", "音トレ5段 SCENE3_Q1.mp3"] },
    { series: "リスニング", title: "Scene4 Topic Narrations 様々な説明文", audio_files: ["音トレ5段SCENE4_No1.mp3", "音トレ5段SCENE4_Q1.mp3"] },
    { series: "リスニング", title: "Scene5 Listening Comprehension Mock Test リスニング・ミニ模試", audio_files: ["音トレ5段SCENE5_No1.mp3", "音トレ5段 SCENE5_Q1.mp3"] }
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
    { series: "長文", title: "TOPIC15 International Affairs 国際情勢", audio_files: ["ontre4_topic15.mp3"]},
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
    { series: "リスニング", title: "Scene1", audio_files: ["音トレ3段SCENE1_No1", "音トレ3段SCENE1_Q1"]},
    { series: "リスニング", title: "Scene2", audio_files: ["音トレ3段SCENE2_No1", "音トレ3段SCENE2_Q1"]},
    { series: "リスニング", title: "Scene3", audio_files: ["音トレ3段SCENE3_No1", "音トレ3段SCENE3_Q1"]},
    { series: "リスニング", title: "Scene4", audio_files: ["音トレ3段SCENE4_No1", "音トレ3段SCENE4_Q1"]},
    { series: "リスニング", title: "Scene5", audio_files: ["音トレ3段SCENE5_No1", "音トレ3段SCENE5_Q1"]},
    { series: "リスニング", title: "Scene6", audio_files: ["音トレ3段SCENE6_No1", "音トレ3段SCENE6_Q1"]},
    { series: "リスニング", title: "Scene7", audio_files: ["音トレ3段SCENE7_No1", "音トレ3段SCENE7_Q1"]},
    { series: "リスニング", title: "Scene8", audio_files: ["音トレ3段SCENE8_No1", "音トレ3段SCENE8_Q1"]},
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
    { series: "リスニング", title: "Scene1", audio_files: ["音トレ2段SCENE1_No1", "音トレ2段SCENE1_Q1"]},
    { series: "リスニング", title: "Scene2", audio_files: ["音トレ2段SCENE2_No1", "音トレ2段SCENE2_Q1"]},
    { series: "リスニング", title: "Scene3", audio_files: ["音トレ2段SCENE3_No1", "音トレ2段SCENE3_Q1"]},
    { series: "リスニング", title: "Scene4", audio_files: ["音トレ2段SCENE4_No1", "音トレ2段SCENE4_Q1"]},
    { series: "リスニング", title: "Scene5", audio_files: ["音トレ2段SCENE5_No1", "音トレ2段SCENE5_Q1"]},
    { series: "リスニング", title: "Scene6", audio_files: ["音トレ2段SCENE6_No1", "音トレ2段SCENE6_Q1"]},
    { series: "リスニング", title: "Scene7", audio_files: ["音トレ2段SCENE7_No1", "音トレ2段SCENE7_Q1"]},
    { series: "リスニング", title: "Scene8", audio_files: ["音トレ2段SCENE8_No1", "音トレ2段SCENE8_Q1"]},
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
    { series: "リスニング", title: "Scene3", audio_files: ["音トレ初段SCENE3_No1.mp3", "音トレ初段SCENE3_No2.mp3", "音トレ初段SCENE3_No3.mp3", "音トレ初段SCENE3_No4.mp3", "音トレ初段SCENE3_Q1.mp3", "音トレ初段SCENE3_Q2.mp3", "音トレ初段SCENE3_Q3.mp3", "音トレ初段SCENE3_Q4.mp3", "音トレ初段SCENE3_Q5.mp3", "音トレ初段SCENE3_Q6.mp3", "音トレ初段SCENE3_Q7.mp3", "音トレ初段SCENE4_Q8.mp3"]},
    { series: "リスニング", title: "Scene4", audio_files: ["音トレ初段SCENE4_No1.mp3", "音トレ初段SCENE4_No2.mp3", "音トレ初段SCENE4_No3.mp3", "音トレ初段SCENE4_No4.mp3", "音トレ初段SCENE4_Q1.mp3", "音トレ初段SCENE4_Q2.mp3", "音トレ初段SCENE4_Q3.mp3", "音トレ初段SCENE4_Q4.mp3", "音トレ初段SCENE4_Q5.mp3", "音トレ初段SCENE4_Q6.mp3", "音トレ初段SCENE4_Q7.mp3", "音トレ初段SCENE4_Q8.mp3"]}
  ]

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
    { series: "リスニング問題にチャレンジ", title: "Unit1 リスニング問題にチャレンジ", audio_files: ["Unit1 リスニング問題にチャレンジ.mp3"]},
    { series: "リスニング問題にチャレンジ", title: "Unit2 リスニング問題にチャレンジ", audio_files: ["Unit2 リスニング問題にチャレンジ.mp3"]},
    { series: "リスニング問題にチャレンジ", title: "Unit3 リスニング問題にチャレンジ", audio_files: ["Unit3 リスニング問題にチャレンジ.mp3"]},
    { series: "リスニング問題にチャレンジ", title: "Unit4 リスニング問題にチャレンジ", audio_files: ["Unit4 リスニング問題にチャレンジ.mp3"]},
    { series: "リスニング問題にチャレンジ", title: "Unit5 リスニング問題にチャレンジ", audio_files: ["Unit5 リスニング問題にチャレンジ.mp3"]},
    { series: "リスニング問題にチャレンジ", title: "Unit6 リスニング問題にチャレンジ", audio_files: ["Unit6 リスニング問題にチャレンジ.mp3"]},
    { series: "リスニング問題にチャレンジ", title: "Unit7 リスニング問題にチャレンジ", audio_files: ["Unit7 リスニング問題にチャレンジ.mp3"]},
    { series: "リスニング問題にチャレンジ", title: "Unit8 リスニング問題にチャレンジ", audio_files: ["Unit8 リスニング問題にチャレンジ.mp3"]},
    { series: "リスニング問題にチャレンジ", title: "Unit9 リスニング問題にチャレンジ", audio_files: ["Unit9 リスニング問題にチャレンジ.mp3"]},
    { series: "リスニング問題にチャレンジ", title: "Unit10 リスニング問題にチャレンジ", audio_files: ["Unit10 リスニング問題にチャレンジ.mp3"]},
    { series: "リスニング問題にチャレンジ", title: "Unit11 リスニング問題にチャレンジ", audio_files: ["Unit11 リスニング問題にチャレンジ.mp3"]},
    { series: "リスニング問題にチャレンジ", title: "Unit12 リスニング問題にチャレンジ", audio_files: ["Unit12 リスニング問題にチャレンジ.mp3"]},
    { series: "リスニング問題にチャレンジ", title: "Unit13 リスニング問題にチャレンジ", audio_files: ["Unit13 リスニング問題にチャレンジ.mp3"]},
    { series: "リスニング問題にチャレンジ", title: "Unit14 リスニング問題にチャレンジ", audio_files: ["Unit14 リスニング問題にチャレンジ.mp3"]},
    { series: "リスニング問題にチャレンジ", title: "Unit15 リスニング問題にチャレンジ", audio_files: ["Unit15 リスニング問題にチャレンジ.mp3"]},
    { series: "リスニング問題にチャレンジ", title: "Unit16 リスニング問題にチャレンジ", audio_files: ["Unit16 リスニング問題にチャレンジ.mp3"]},
    { series: "リスニング問題にチャレンジ", title: "Unit17 リスニング問題にチャレンジ", audio_files: ["Unit17 リスニング問題にチャレンジ.mp3"]},
    { series: "リスニング問題にチャレンジ", title: "Unit18 リスニング問題にチャレンジ", audio_files: ["Unit18 リスニング問題にチャレンジ.mp3"]},
    { series: "リスニング問題にチャレンジ", title: "Unit19 リスニング問題にチャレンジ", audio_files: ["Unit19 リスニング問題にチャレンジ.mp3"]},
    { series: "リスニング問題にチャレンジ", title: "Unit20 リスニング問題にチャレンジ", audio_files: ["Unit20 リスニング問題にチャレンジ.mp3"]},
    { series: "リスニング問題にチャレンジ", title: "Unit21 リスニング問題にチャレンジ", audio_files: ["Unit21 リスニング問題にチャレンジ.mp3"]},
    { series: "リスニング問題にチャレンジ", title: "Unit22 リスニング問題にチャレンジ", audio_files: ["Unit22 リスニング問題にチャレンジ.mp3"]},
    { series: "リスニング問題にチャレンジ", title: "Unit23 リスニング問題にチャレンジ", audio_files: ["Unit23 リスニング問題にチャレンジ.mp3"]},
    { series: "リスニング問題にチャレンジ", title: "Unit24 リスニング問題にチャレンジ", audio_files: ["Unit24 リスニング問題にチャレンジ.mp3"]},
    { series: "リスニング問題にチャレンジ", title: "Unit25 リスニング問題にチャレンジ", audio_files: ["Unit25 リスニング問題にチャレンジ.mp3"]},
    { series: "リスニング問題にチャレンジ", title: "Unit26 リスニング問題にチャレンジ", audio_files: ["Unit26 リスニング問題にチャレンジ.mp3"]}
]
create_chapters_for("リズムでマスター英検５級", chapters_data1)
end