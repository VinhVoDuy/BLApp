class AddLockVersionToRemainings < ActiveRecord::Migration[5.0]
  def change
    add_column :remainings, :lock_version, :integer, default: 0, null: false
  end
end
