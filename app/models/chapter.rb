class Chapter < ApplicationRecord
    belongs_to :textbook
    has_many :audios, dependent: :destroy
end
