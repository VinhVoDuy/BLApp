class AddHeadingAndDescriptionToLandingImages < ActiveRecord::Migration[5.0]
  def change
    add_column :landing_images, :heading, :string
    add_column :landing_images, :description, :string
  end
end
