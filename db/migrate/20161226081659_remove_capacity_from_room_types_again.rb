class RemoveCapacityFromRoomTypesAgain < ActiveRecord::Migration[5.0]
  def change
    remove_column :room_types, :capacity
  end
end
