require 'rails_helper'
RSpec.describe CreateReservation do
  it 'find booking rooms' do
    create(:reservation)
    service = FindAvailableRoom.new(Date.yesterday, Date.tomorrow)
    expect(service.booking.first).to be_present

    service = FindAvailableRoom.new(Date.tomorrow, Date.tomorrow + 1.day)
    expect(service.booking.first).not_to be_present

    service = FindAvailableRoom.new(Date.yesterday - 1.day, Date.yesterday)
    expect(service.booking.first).not_to be_present

    service = FindAvailableRoom.new(Date.today, Date.tomorrow)
    expect(service.booking.first).to be_present

    service = FindAvailableRoom.new(Date.yesterday, Date.today)
    expect(service.booking.first).to be_present
  end

  it 'rooms have enought quantity' do
    create(:reservation)
    service = FindAvailableRoom.new(Date.tomorrow, Date.tomorrow + 1.day)
    expect(service.available).to be_present
  end
end
