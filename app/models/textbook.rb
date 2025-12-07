class Textbook < ApplicationRecord
    validates :name, presence: true
    validates :level, presence: true
    validates :cover_image, presence: true
end
