FactoryGirl.define do
  factory :reservation do
    user
    start_date Date.yesterday
    end_date Date.tomorrow
    price 100
    after(:create) do |reservation|
      create_list(:item_reservation, 2, reservation: reservation )
    end
  end
end
