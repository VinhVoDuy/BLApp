class TourImage < ApplicationRecord
  belongs_to :tour
  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  scope :primary, -> { where(primary: true).first || first}
end
