class CreatePromotions < ActiveRecord::Migration[5.0]
  def change
    create_table :promotions do |t|
      t.integer :percentage_off
      t.integer :amount_off
      t.string :code
      t.text :description
      t.boolean :active
      t.string :name

      t.timestamps
    end
    add_index :promotions, :code, unique: true
  end
end
