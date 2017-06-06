class AddSizeToRoomTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :room_types, :size, :integer
  end
end
