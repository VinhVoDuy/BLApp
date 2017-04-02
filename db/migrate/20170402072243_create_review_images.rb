class CreateReviewImages < ActiveRecord::Migration[5.0]
  def change
    create_table :review_images do |t|
      t.attachment :image

      t.timestamps
    end
  end
end
