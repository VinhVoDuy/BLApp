class SetRemaining
  def initialize reservation
    @item_reservations = reservation.item_reservations.where(reservable_type: 'RoomType')
    @reservation = reservation
  end

  def run
    @item_reservations.each do |item_reservation|
      (@reservation.start_date...@reservation.end_date).each do |date|
        remaining = Remaining.find_or_initialize_by(room_type: item_reservation.reservable, date: date)
        if remaining.persisted?
          remaining.reduce_quantity_left item_reservation.quantity
        else
          remaining.initialize_quantity_left  item_reservation.quantity
        end
      end
    end
  end
end
