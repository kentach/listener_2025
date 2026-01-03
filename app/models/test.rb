require 'amatch'

class Test < ApplicationRecord
  belongs_to :user
  has_many :test_questions, dependent: :destroy
  has_many :vocabularies, through: :test_questions

  def grade_answer(user_answer)
    correct_answer = self.correct_answer.strip.downcase
    user_answer = user_answer.strip.downcase

    # 完全一致
    return '〇' if user_answer == correct_answer

    # 少し間違っている場合（Levenshtein距離2文字まで）
    m = Amatch::Levenshtein.new(correct_answer)
    distance = m.match(user_answer)
    return '△' if distance <= 2

    # それ以外は間違い
    '✖︎'
  end
end