class Spot < ApplicationRecord
    has_many :user_spots, dependent: :destroy
    has_many :users, through: :user_spots
    has_many :event_spots, dependent: :destroy
    has_many :events, through: :event_spots
    has_many :photos, dependent: :destroy
    has_many :journals, dependent: :destroy
end
