class Book < ApplicationRecord
    belongs_to :user
    attachment :profile_image
    
    validates :title, presence: true
    validates :opinion, presence: true
    validates :opinion, length: {maximum: 200 }
end
