class AddInitPriceToRoomTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :room_types, :init_price, :float
  end
end
