class RemoveRoomTypeAddReservableToItemReservations < ActiveRecord::Migration[5.0]
  def change
    remove_column :item_reservations, :room_type_id
    add_reference :item_reservations, :reservable, polymorphic: true
  end
end
