class CreateContacts < ActiveRecord::Migration[5.0]
  def change
    create_table :contacts do |t|
      t.string :full_name
      t.string :email
      t.boolean :inferred, default: false

      t.timestamps
    end
    add_index :contacts, :email, unique: true
  end
end
