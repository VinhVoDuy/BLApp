class ChangeColumnNameInRoomTypes < ActiveRecord::Migration[5.0]
  def change
    change_column :room_types, :name, :string
  end
end
