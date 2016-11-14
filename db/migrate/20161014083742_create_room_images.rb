class CreateRoomImages < ActiveRecord::Migration[5.0]
  def change
    create_table :room_images do |t|
      t.belongs_to :room_type, foreign_key: true
      t.attachment :image

      t.timestamps
    end
  end
end
