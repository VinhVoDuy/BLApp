require 'rails_helper'
RSpec.describe AvailableRoom do
  let(:room1) { create(:room_type, :small) }
  let(:room2) { create(:room_type, :medium) }

  it 'room is fully booked' do
    create(:remaining, room_type: room2, date: 1.days.ago, quantity_left: 0)
    create(:remaining, room_type: room1, date: 1.days.ago, quantity_left: 1)
    availability = AvailableRoom.new(room_type: nil, quantity: 2, start_date: 1.days.ago.to_s, end_date: 2.days.from_now.to_s)
    expect(availability.run).to eq false
    expect(availability.error).to eq 'All rooms is fully booked'
  end

  it 'can not book even if sum quantity match' do
    create(:remaining, room_type: room1, date: 1.days.ago, quantity_left: 1)
    create(:remaining, room_type: room2, date: 1.days.ago, quantity_left: 1)
    availability = AvailableRoom.new(room_type: nil, quantity: 3, start_date: 1.days.ago.to_s, end_date: 2.days.from_now.to_s)
    expect(availability.run).to eq false
    expect(availability.error).to eq 'All rooms is fully booked'
  end
end
