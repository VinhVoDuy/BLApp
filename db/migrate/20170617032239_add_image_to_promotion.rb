class AddImageToPromotion < ActiveRecord::Migration[5.0]
  def change
    add_attachment :promotions, :image
  end
end
