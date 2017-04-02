class RenameColumnTotalRoom < ActiveRecord::Migration[5.0]
  def change
    rename_column :room_types, :total_room, :capacity
  end
end
