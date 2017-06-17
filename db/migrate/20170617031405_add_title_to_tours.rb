class AddTitleToTours < ActiveRecord::Migration[5.0]
  def change
    add_column :tours, :title, :string
  end
end
