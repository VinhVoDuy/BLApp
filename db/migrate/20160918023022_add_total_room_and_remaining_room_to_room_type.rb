class AddTotalRoomAndRemainingRoomToRoomType < ActiveRecord::Migration[5.0]
  def change
    add_column :room_types, :total_room, :integer, default: 0
    add_column :room_types, :remaining_room, :integer, default: 0
  end
end
