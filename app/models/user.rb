class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, presence: true, uniqueness: true
  validates :eiken_level, presence: true
  has_many :favorites, dependent: :destroy
  has_many :favorited_audios, through: :favorites, source: :audio

  def favorited?(audio)
    favorited_audios.include?(audio)
  end

    EIKEN_ORDER = [
    "まだ取得していない",
    "英検5級",
    "英検4級",
    "英検3級",
    "英検準2級",
    "英検準2プラス級",
    "英検2級",
    "英検準1級",
    "英検1級"
  ]

  def eiken_rank
    EIKEN_ORDER.index(eiken_level) || 0
  end
end