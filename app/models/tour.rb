class Tour < ApplicationRecord
  has_many :tour_images
  friendly_id :name, use: :slugged
  accepts_nested_attributes_for :tour_images, allow_destroy: true, reject_if: :all_blank
  PRIVATE_GROUP = ['2', '3 - 4', '5 - 7', '8 - 9', '10 +']

  private
  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end
end
