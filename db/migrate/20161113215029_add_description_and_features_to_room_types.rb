class AddDescriptionAndFeaturesToRoomTypes < ActiveRecord::Migration[5.0]
  def change
    add_column :room_types, :description, :string
    add_column :room_types, :features, :text, array: true, default: []
  end
end
