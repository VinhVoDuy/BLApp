class AddAmountToItemReservations < ActiveRecord::Migration[5.0]
  def change
    add_column :item_reservations, :quantity, :integer, default: 1
    add_column :item_reservations, :amount, :integer
  end
end
