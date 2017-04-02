class AddContentAndNameToReviewImages < ActiveRecord::Migration[5.0]
  def change
    add_column :review_images, :content, :string
    add_column :review_images, :name, :string
  end
end
