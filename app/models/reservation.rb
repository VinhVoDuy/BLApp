class Reservation < ApplicationRecord
  belongs_to :user
  has_many :item_reservations, dependent: :destroy
  accepts_nested_attributes_for :item_reservations
  validates_presence_of :start_date, :end_date

  after_create :compute_sum_items_price

  def compute_sum_items_price
    self.price = item_reservations.map{|item| item.price.to_f}.sum
  end
end
