class CreateItemReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :item_reservations do |t|
      t.belongs_to :room_type, foreign_key: true
      t.belongs_to :reservation, foreign_key: true
      t.float :price

      t.timestamps
    end
  end
end
