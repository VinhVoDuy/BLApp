class RemoveDurationFromRoomPrices < ActiveRecord::Migration[5.0]
  def change
    remove_column :room_prices, :duration
    add_column :room_prices, :start_date, :date
    add_column :room_prices, :end_date, :date
  end
end
