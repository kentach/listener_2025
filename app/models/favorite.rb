class Favorite < ApplicationRecord
  belongs_to :user
  belongs_to :audio

  validates :user_id, uniqueness: { scope: :audio_id }
end
