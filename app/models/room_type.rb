class RoomType < ApplicationRecord
  validates :price, presence: true
  has_many :rooms
end
