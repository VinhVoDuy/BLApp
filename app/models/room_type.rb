class RoomType < ApplicationRecord
  extend FriendlyId
  friendly_id :name, use: :slugged
  attr_accessor :fake_features
  validates :name, uniqueness: true, presence: true
  has_many :rooms
  has_many :room_images, dependent: :destroy
  has_many :room_promotions, dependent: :destroy
  has_many :item_reservations, as: :reservable
  has_many :remainings, dependent: :destroy
  has_one :active_room_promotion,  ->{ where('start_date <= :today AND end_date >= :today', today: Date.today) }, class_name: 'RoomPromotion'

  accepts_nested_attributes_for :room_images, allow_destroy: true, reject_if: :all_blank
  before_save :set_features, if: :fake_features
  def set_features
    self.features = []
    fake_features.split(',').each do |feature|
      self.features << feature.strip
    end
  end

  def dormitory?
    name.downcase =~ /dorm/
  end

end
