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
end