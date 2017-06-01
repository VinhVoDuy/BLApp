class Tour < ApplicationRecord
  has_many :tour_images
  accepts_nested_attributes_for :tour_images, allow_destroy: true, reject_if: :all_blank
  PRIVATE_GROUP = ['2', '3 - 4', '5 - 7', '8 - 9', '10 +']
end
