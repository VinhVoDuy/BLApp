class ItemReservation < ApplicationRecord
  belongs_to :room_type
  belongs_to :reservation, optional: true

  before_create :compute_amount, :compute_price

  def compute_price
    self.price = self.amount * (self.quantity || 1)
  end

  def compute_amount
    self.amount = room_type.price - discount_room_price
  end

  def discount_room_price
    room_type.active_room_promotion.try(:discount_price).to_f
  end
end
