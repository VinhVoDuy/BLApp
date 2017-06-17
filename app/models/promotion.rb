class Promotion < ApplicationRecord
  include FriendlyId
  friendly_id :name, use: :slugged
  has_attached_file :image
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/

  scope :published, -> { where(published: true) }

  def discount
    if percentage_off.present?
      "#{percentage_off}%"
    else
      amount_off
      "$#{percentage_off}"
    end
  end
  private
  def should_generate_new_friendly_id?
    slug.blank? || name_changed?
  end
end
