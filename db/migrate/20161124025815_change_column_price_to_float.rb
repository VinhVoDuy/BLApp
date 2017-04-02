class ChangeColumnPriceToFloat < ActiveRecord::Migration[5.0]
  def change
    change_column :room_prices, :price, :float, default: 0
  end
end
