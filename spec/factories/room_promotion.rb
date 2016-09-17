FactoryGirl.define do
  factory :room_promotion do
    room_type
    start_date Date.today
    end_date Date.tomorrow
    percentage 10

    trait :amount_present do
      amount 30
    end

    trait :amount_present_only do
      percentage 0
      amount 30
    end

    trait :inactive do
      start_date Date.yesterday
      end_date Date.yesterday
    end
  end
end
