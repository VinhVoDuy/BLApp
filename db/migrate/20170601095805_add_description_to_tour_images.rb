class AddDescriptionToTourImages < ActiveRecord::Migration[5.0]
  def change
    add_column :tour_images, :description, :text
    remove_column :tours, :description
  end
end
