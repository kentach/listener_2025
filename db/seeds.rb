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
