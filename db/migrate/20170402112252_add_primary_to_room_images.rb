class AddPrimaryToRoomImages < ActiveRecord::Migration[5.0]
  def change
    add_column :room_images, :primary, :boolean, default: false
  end
end
