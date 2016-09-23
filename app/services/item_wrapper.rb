class ItemWrapper
  def initialize item_reservation
    @item = item_reservation
  end

  def name
    @item.name
  end

  def description
    @item.description
  end
end
