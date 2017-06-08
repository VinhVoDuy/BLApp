class AddFavouriteToRoomTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :room_types, :favourite, :boolean, default: false
  end
end
