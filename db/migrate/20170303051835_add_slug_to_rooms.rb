class AddSlugToRooms < ActiveRecord::Migration[5.0]
  def change
    add_column :room_types, :slug, :string
    add_index :room_types, :slug, unique: true
  end
end
