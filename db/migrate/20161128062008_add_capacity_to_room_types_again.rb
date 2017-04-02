class AddCapacityToRoomTypesAgain < ActiveRecord::Migration[5.0]
  def change
    add_column :room_types, :capacity, :integer, default: 1
  end
end
