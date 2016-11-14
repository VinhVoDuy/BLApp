class CreateIdentities < ActiveRecord::Migration[5.0]
  def change
    create_table :identities do |t|
      t.belongs_to :user, foreign_key: true
      t.string :provider
      t.string :uid
    end
  end
end
