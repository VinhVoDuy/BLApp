class CreateReservation
  attr_reader :reservation, :error
  def initialize user, reservation_params
    @user = user
    @reservation_params = reservation_params
  end

  def run
    Reservation.transaction do
      @reservation = Reservation.create!(@reservation_params)
      set_remaining_service = SetRemaining.new(@reservation)
      set_remaining_service.run
    end
    return true
  rescue Exception => e
    @error = e.message
    return false
  end
end
