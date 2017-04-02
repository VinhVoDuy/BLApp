class AddColumnQuantityToRoomTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :room_types, :quantity, :integer, default: 10, null: false
  end
end
