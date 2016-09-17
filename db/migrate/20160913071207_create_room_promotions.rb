class CreateRoomPromotions < ActiveRecord::Migration[5.0]
  def change
    create_table :room_promotions do |t|
      t.belongs_to :room_type, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.integer :percentage
      t.integer :amount

      t.timestamps
    end
  end
end
