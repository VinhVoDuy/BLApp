class AddBedTypeToRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :room_types, :bed_type, :string
  end
end
