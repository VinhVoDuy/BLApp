class LandingImage < ApplicationRecord
  has_attached_file :image, styles: { medium: "1700x449>"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
