class RoomType < ApplicationRecord
  enum name: ['Room Type 1', 'Room Type 2', 'Room Type 3']
  validates :price, presence: true
  validates :name, uniqueness: true, presence: true
  has_many :rooms
  has_many :room_promotions, dependent: :destroy
  has_many :item_reservations, as: :reservable
  has_one :active_room_promotion,  ->{ where('start_date <= :today AND end_date >= :today', today: Date.today) }, class_name: 'RoomPromotion'
end
