class Remaining < ApplicationRecord
  belongs_to :room_type
  validates :date, presence: true
  validates :room_type_id, uniqueness: { scope: :date }
  validates :quantity_left, numericality: { greater_than_or_equal_to: 0 }
  def initialize_quantity_left(quantity)
    update_attributes!(quantity_left: room_type.quantity - quantity)
  end

  def reduce_quantity_left(quantity)
    update_attributes!(quantity_left: quantity_left - quantity)
  rescue ActiveRecord::StaleObjectError
    reload
    retry
  end
end
