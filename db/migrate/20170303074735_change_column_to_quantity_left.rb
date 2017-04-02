class ChangeColumnToQuantityLeft < ActiveRecord::Migration[5.0]
  def change
    rename_column :remainings, :capacity_left, :quantity_left
  end
end
