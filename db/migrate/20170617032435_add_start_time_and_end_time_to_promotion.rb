class AddStartTimeAndEndTimeToPromotion < ActiveRecord::Migration[5.0]
  def change
    add_column :promotions, :start_time, :datetime
    add_column :promotions, :end_time, :datetime
  end
end
