class CreateTourImages < ActiveRecord::Migration[5.0]
  def change
    create_table :tour_images do |t|
      t.belongs_to :tour, foreign_key: true
      t.attachment :image
      t.boolean :primary, default: false

      t.timestamps
    end
  end
end
