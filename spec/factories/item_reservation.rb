FactoryGirl.define do
  factory :item_reservation do
    reservation
    quantity 1
    price 10
    amount 10
    reservable { RoomType.first || create(:room_type) }
  end
end
