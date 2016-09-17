FactoryGirl.define do
  sequence(:email) { |n| "email#{n}@gmail.com" }
  factory :user do
    email
    password 'password'
    password_confirmation 'password'
  end
end
