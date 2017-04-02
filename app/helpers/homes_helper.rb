module HomesHelper
  def price_formatter price
    price.to_s.remove(/\.0|0+$/)
  end
end
