class RemovePriceFromRoomTypes < ActiveRecord::Migration[5.0]
  def change
    remove_column :room_types, :price
  end
end
