class AddSlugToPromotions < ActiveRecord::Migration[5.0]
  def change
    add_column :promotions, :slug, :string
  end
end
