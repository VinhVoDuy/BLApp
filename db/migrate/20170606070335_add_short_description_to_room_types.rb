class AddShortDescriptionToRoomTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :room_types, :short_description, :text
  end
end
