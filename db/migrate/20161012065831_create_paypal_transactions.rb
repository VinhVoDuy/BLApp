class CreatePaypalTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :paypal_transactions do |t|
      t.string :token
      t.string :payer_id
      t.string :transaction_id
      t.belongs_to :reservation, foreign_key: true

      t.timestamps
    end
  end
end
