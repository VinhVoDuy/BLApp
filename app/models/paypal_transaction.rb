class PaypalTransaction < ApplicationRecord
  belongs_to :reservation
  def self.available_for_token finding_token
    PaypalTransaction.find_by(transaction_id: nil, token: finding_token)
  end
end
