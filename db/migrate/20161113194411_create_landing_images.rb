class CreateLandingImages < ActiveRecord::Migration[5.0]
  def change
    create_table :landing_images do |t|
      t.attachment :image
      t.string :url

      t.timestamps
    end
  end
end
