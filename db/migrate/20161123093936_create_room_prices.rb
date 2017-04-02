class CreateRoomPrices < ActiveRecord::Migration[5.0]
  def change
    create_table :room_prices do |t|
      t.belongs_to :room_type, foreign_key: true
      t.integer :price
      t.daterange :duration

      t.timestamps
    end
  end
end
