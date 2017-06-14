class AddLastBookTimeToRoomTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :room_types, :last_book_time, :datetime
  end
end
