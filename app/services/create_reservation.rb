class CreateReservation
  attr_reader :reservation
  def initialize user, reservation_params
    @user = user
    @reservation_params = reservation_params
  end

  def run
    @reservation = Reservation.create!(@reservation_params)
    return true
  end
end
