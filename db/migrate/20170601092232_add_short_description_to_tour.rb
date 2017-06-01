class AddShortDescriptionToTour < ActiveRecord::Migration[5.0]
  def change
    add_column :tours, :short_description, :string
  end
end
