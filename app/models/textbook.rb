class Textbook < ApplicationRecord
    has_many :chapters, dependent: :destroy
    
    validates :name, presence: true
    validates :level, presence: true
    validates :cover_image, presence: true
end
