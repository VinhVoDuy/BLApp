class RoomImage < ApplicationRecord
  belongs_to :room_type, optional: true

  has_attached_file :image, styles: { medium: '800x504>', thumb: "356x228>"}
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  scope :primary, -> { where(primary: true).first || first}
end
