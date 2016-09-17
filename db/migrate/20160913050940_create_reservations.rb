class CreateReservations < ActiveRecord::Migration[5.0]
  def change
    create_table :reservations do |t|
      t.belongs_to :user, foreign_key: true
      t.date :start_date
      t.date :end_date
      t.float :price

      t.timestamps
    end
  end
end
