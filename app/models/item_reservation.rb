class ItemReservation < ApplicationRecord
  belongs_to :reservable, polymorphic: true
  belongs_to :reservation, optional: true

  before_create :set_amount_and_price

  def set_amount_and_price
    self.amount = ReservablePricing.new(reservable).amount
    self.price = self.amount * (self.quantity || 1)
  end

end
