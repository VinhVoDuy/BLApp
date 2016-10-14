FactoryGirl.define do
  factory :paypal_transaction do
    token "MyString"
    payer_id "MyString"
    transaction_id "MyString"
    reservation nil
  end
end
