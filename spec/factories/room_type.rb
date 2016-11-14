FactoryGirl.define do
  factory :room_type do
    sequence(:name) {|n| "Room Type #{n}"}
    price 50
    total_room 3
    remaining_room 3
    trait :small do
      price 100
    end

    trait :medium do
      price 150
    end

    trait :large do
      price 200
    end
  end
end
