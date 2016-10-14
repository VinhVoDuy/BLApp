class ItemWrapper
  def initialize item_reservation
    @item = item_reservation
  end

  def name
    @item.reservable.name
  end

  def description
    'test description'
  end

  def amount
    @item.amount
  end

  def quantity
    @item.quantity
  end
end
