class TestsController < ApplicationController
  before_action :set_test, only: [:show, :submit, :result]

  # 新規テスト作成
  def create
    test = current_user.tests.create!(
      series: params[:series],
      level: params[:level],
      range_start: params[:range_start],
      range_end: params[:range_end],
      question_language: params[:question_language],
      score: 0,
      passed: false
    )

    # 該当 series の単語からランダムに10問取得
    words = Vocabulary.where(
      series: params[:series],
      level: params[:level],
      number: params[:range_start]..params[:range_end]
    ).order("RANDOM()").limit(10)

    words.each_with_index do |vocab, index|
      test.test_questions.create!(
        vocabulary: vocab,
        position: index + 1
      )
    end

    redirect_to test_path(test)
  end

  # テスト問題表示
def show
  @test = Test.find(params[:id])

  @vocabularies = Vocabulary
    .where(level: @test.level, series: @test.series)
    .where(number: @test.range_start..@test.range_end)
    .order("RANDOM()")
    .limit(10)

  # 4択用の選択肢
  @choices = {}

  @vocabularies.each do |vocab|
    correct = vocab.japanese

    wrongs = Vocabulary
      .where(level: @test.level)
      .where.not(id: vocab.id)
      .order("RANDOM()")
      .limit(3)
      .pluck(:japanese)

    @choices[vocab.id] = (wrongs + [correct]).shuffle
  end
end


  # 解答送信・採点
def submit
  answers = params[:answers] || {}
  correct_count = 0

  @test.test_questions.each do |q|
    user_answer = answers[q.id.to_s]&.strip || ""
    q.user_answer = user_answer

    # 正解を言語に応じて取得
    correct_answer = @test.question_language == "english" ? q.vocabulary.japanese : q.vocabulary.english

    # 判定
    q.result = grade_answer(user_answer, correct_answer)
    correct_count += 1 if q.result == "〇"
    q.save
  end

  @test.score = correct_count
  @test.passed = (correct_count.to_f / @test.test_questions.count) >= 0.7
  @test.save!

  redirect_to result_test_path(@test)
end


  # 結果表示
  def result
    @questions = @test.test_questions.includes(:vocabulary).order(:position)
  end

  require 'amatch'

  private

  def set_test
    @test = Test.find(params[:id])
  end

 def grade_answer(user_answer, correct_answers_string)
  user_answer = user_answer.strip.downcase
  correct_answers = correct_answers_string.split(",").map(&:strip).map(&:downcase)

  # 完全一致
  return "〇" if correct_answers.include?(user_answer)

  # 少し間違っている場合（Levenshtein距離2文字以内）
  correct_answers.each do |ans|
    distance = Amatch::Levenshtein.new(ans).match(user_answer)
    return "△" if distance <= 2
  end

  # それ以外は✖︎
  "✖︎"
end

end
