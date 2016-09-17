class RoomType < ApplicationRecord
  validates :price, presence: true
  validates :name, uniqueness: true, presence: true
  has_many :rooms
  has_many :room_promotions, dependent: :destroy
  has_one :active_room_promotion,  ->{ where('start_date <= :today AND end_date >= :today', today: Date.today) }, class_name: 'RoomPromotion'
end
