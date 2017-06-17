class AddPublishedToPromotions < ActiveRecord::Migration[5.0]
  def change
    add_column :promotions, :published, :boolean, default: false
  end
end
