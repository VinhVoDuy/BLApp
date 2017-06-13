class AddSlugToTours < ActiveRecord::Migration[5.0]
  def change
    add_column :tours, :slug, :string
  end
end
