class Room < ApplicationRecord
  belongs_to :room_type
  validates :number, uniqueness: true, presence: true
end
