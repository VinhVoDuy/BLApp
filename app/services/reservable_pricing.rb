class ReservablePricing
  def initialize reservable
    @reservable = reservable
  end

  def amount
    @reservable.price - discount
  end

  def discount
    @reservable.active_room_promotion.try(:discount_price).to_f
  end

  def raw_amount
    @reservable.price
  end
end
