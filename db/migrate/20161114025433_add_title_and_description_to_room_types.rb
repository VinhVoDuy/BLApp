class AddTitleAndDescriptionToRoomTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :room_types, :title, :string
  end
end
