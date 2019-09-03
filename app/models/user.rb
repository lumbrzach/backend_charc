class User < ApplicationRecord
    has_secure_password
    has_many :user_spots, dependent: :destroy
    has_many :spots, through: :user_spots
    has_many :user_events, dependent: :destroy
    has_many :events, through: :user_events
    has_many :photos, dependent: :destroy
    has_many :journals, dependent: :destroy
    validates :username, presence: true, uniqueness: true
end
