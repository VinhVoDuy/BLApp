class RemoveRemainingRoomFromRoomTypes < ActiveRecord::Migration[5.0]
  def change
    remove_column :room_types, :remaining_room
  end
end
