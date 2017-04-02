FactoryGirl.define do
  factory :room_type do
    sequence(:name) {|n| "Room Type #{n}"}
    after(:create) do |obj|
      obj.room_prices.create(price: 50, start_date: Date.today, end_date: Duration::END_OF_DURATION)
    end
    quantity 2
    trait :small do
      capacity 1
      after(:create) do |obj|
        obj.room_prices.create(price: 100, start_date: Date.today, end_date: Duration::END_OF_DURATION)
      end
    end

    trait :medium do
      capacity 2
      after(:create) do |obj|
        obj.room_prices.create(price: 150, start_date: Date.today, end_date: Duration::END_OF_DURATION)
      end
    end

    trait :large do
      capacity 4
      after(:create) do |obj|
        obj.room_prices.create(price: 200, start_date: Date.today, end_date: Duration::END_OF_DURATION)
      end
    end
  end
end
