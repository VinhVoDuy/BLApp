class CreateRemainings < ActiveRecord::Migration[5.0]
  def change
    create_table :remainings do |t|
      t.integer :capacity_left, null: false
      t.belongs_to :room_type, foreign_key: true, null: false
      t.date :date

      t.timestamps
    end
    add_index :remainings, [:room_type_id, :date], unique: true
  end
end
