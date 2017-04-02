class AddPriceToRoomTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :room_types, :price, :float, null: false, default: 0
  end
end
