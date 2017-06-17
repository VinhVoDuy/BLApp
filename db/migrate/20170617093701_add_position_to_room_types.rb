class AddPositionToRoomTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :room_types, :position, :integer
  end
end
