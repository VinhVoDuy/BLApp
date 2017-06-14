class AddGroupToTours < ActiveRecord::Migration[5.0]
  def change
    add_column :tours, :group, :integer
  end
end
