class Vocabulary < ApplicationRecord
  validates :series, :number, :english, :japanese, presence: true
  has_one_attached :audio
  has_many :test_questions, dependent: :destroy

  def audio_url
    Rails.application.routes.url_helpers.url_for(audio) if audio.attached?
  end
end