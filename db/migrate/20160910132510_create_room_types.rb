class CreateRoomTypes < ActiveRecord::Migration[5.0]
  def change
    create_table :room_types do |t|
      t.integer :name
      t.float :price

      t.timestamps
    end
  end
end
