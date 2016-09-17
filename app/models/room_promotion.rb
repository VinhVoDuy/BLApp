class RoomPromotion < ApplicationRecord
  belongs_to :room_type
  validates_presence_of :start_date, :end_date

  validate :percentage_or_amount_be_present

  def percentage_or_amount_be_present
    errors.add(:base, 'Percentage or Amount should be present') if [ percentage.to_i, amount.to_i ].max == 0
  end

  def discount_price
    if percentage.to_i > 0
      room_type.price * ( percentage/100.0 )
    else
      amount.to_i
    end
  end
end
