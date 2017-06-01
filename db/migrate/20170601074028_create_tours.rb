class CreateTours < ActiveRecord::Migration[5.0]
  def change
    create_table :tours do |t|
      t.string :name
      t.string :start_time
      t.string :end_time
      t.text :description
      t.float :price
      t.text :included
      t.text :private_tour_pricing, array: true, default: []

      t.timestamps
    end
  end
end
