class CreateRoomCapacities < ActiveRecord::Migration[5.0]
  def change
    create_table :room_capacities do |t|
      t.belongs_to :room_type, foreign_key: true
      t.integer :capacity, default: 10
      t.date :start_date
      t.date :end_date

      t.timestamps
    end
  end
end
