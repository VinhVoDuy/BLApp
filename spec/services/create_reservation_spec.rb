require 'rails_helper'
RSpec.describe CreateReservation do
  before {
    @user = create :user
    @default_params = { user_id: @user.id, start_date: Date.today, end_date: Date.tomorrow }
    @small_room_type = create :room_type, :small
    @medium_room_type = create :room_type, :medium
  }
  describe 'create only one room' do
    it 'works' do
      @params = @default_params.merge({ item_reservations_attributes: [{ room_type_id: @small_room_type.id }] })
      service = CreateReservation.new(@user, @params)
      expect(service.run).to eq true
      expect(service.reservation.price).to eq @small_room_type.price
    end
  end

  describe 'create more than one room' do
    it 'works' do
      @params = @default_params.merge({ item_reservations_attributes: [{ room_type_id: @small_room_type.id }, {room_type_id: @medium_room_type.id}] })
      service = CreateReservation.new(@user, @params)
      expect(service.run).to eq true
      expect(service.reservation.price).to eq(@small_room_type.price + @medium_room_type.price)
    end
  end

  describe 'create with room promotion' do
    it 'works' do
      @promotion = create(:room_promotion, room_type: @small_room_type)
      @params = @default_params.merge({ item_reservations_attributes: [{ room_type_id: @small_room_type.id }] })
      service = CreateReservation.new(@user, @params)
      expect(service.run).to eq true
      expect(service.reservation.price).to eq(@small_room_type.price * (1 - 10/100.0))
    end
  end

  describe 'create with inactive room promotion' do
    it 'do not discount' do
      @promotion = create(:room_promotion, :inactive, room_type: @small_room_type)
      @params = @default_params.merge({ item_reservations_attributes: [{ room_type_id: @small_room_type.id }] })
      service = CreateReservation.new(@user, @params)
      expect(service.run).to eq true
      expect(service.reservation.price).to eq(@small_room_type.price)
    end
  end

  describe 'create with amount only room promotion' do
    it 'works' do
      @promotion = create(:room_promotion, :amount_present_only, room_type: @small_room_type)
      @params = @default_params.merge({ item_reservations_attributes: [{ room_type_id: @small_room_type.id }] })
      service = CreateReservation.new(@user, @params)
      expect(service.run).to eq true
      expect(service.reservation.price).to eq(@small_room_type.price - 30)
    end
  end
end
