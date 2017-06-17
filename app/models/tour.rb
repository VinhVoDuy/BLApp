class Tour < ApplicationRecord
  extend FriendlyId
  acts_as_taggable
  has_many :tour_images, dependent: :destroy
  friendly_id :name, use: :slugged
  accepts_nested_attributes_for :tour_images, allow_destroy: true, reject_if: :all_blank
  PRIVATE_GROUP = ['2', '3 - 4', '5 - 7', '8 - 9', '10 +']

  def class_tag_list
    tag_list.map(&:downcase).map{|e| e.gsub(' ', '_')}.join(' ')
  end
  private
  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end

end
