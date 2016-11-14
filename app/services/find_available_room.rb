class FindAvailableRoom
  def initialize start_date, end_date
    @start_date = start_date
    @end_date = end_date
  end

  def booking
    ItemReservation.joins(:reservation).where(reservable_type: 'RoomType').where('reservations.start_date <= :start_date AND reservations.end_date >= :end_date', start_date: @start_date, end_date: @end_date).select('item_reservations.reservable_id')
  end

  def not_booking
    RoomType.where.not(id: booking)
  end

  def available
    RoomType.joins(:item_reservations).group("room_types.id").select("room_types.*, SUM(quantity) AS total_books, (total_room - SUM(quantity)) AS remaining").having('total_room > Sum(quantity)').where.not(id: booking)
  end

  def run
  end
end
