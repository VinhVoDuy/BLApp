class SetExpressCheckout
  attr_reader :token
  def initialize reservation
    @reservation = reservation
  end

  def run
    response_data = RestClient.post(ENV['paypal_endpoint'], checkout_params)
    p checkout_params
    hash_url = CGI::parse(response_data.body)
    @token = hash_url['TOKEN'].first
  end

  def checkout_params
    default_params.merge(full_payment_params)
  end

  def full_payment_params
    default_params.merge(payment_params).merge(items_params)
  end

  def default_params
    {
      USER: ENV['paypal_user_name'],
      PWD: ENV['paypal_password'],
      SIGNATURE: ENV['paypal_signature'],
      METHOD: 'SetExpressCheckout',
      VERSION: ENV['paypal_api_version'],
      cancelUrl: "http://#{ENV['HOST_NAME']}/paypal/failed",
      returnUrl: "http://#{ENV['HOST_NAME']}/paypal/success",
      SOLUTIONTYPE: 'Sole',
    }
  end

  def payment_params
    {
      PAYMENTREQUEST_0_PAYMENTACTION: 'Authorization',
      PAYMENTREQUEST_0_CURRENCYCODE: 'USD',
      PAYMENTREQUEST_0_AMT: @reservation.price,
    }
  end

  def items_params
    @reservation.item_reservations.each_with_index.inject({}) do |result, (item_reservation, index)|
      result.merge item_params(ItemWrapper.new(item_reservation), index)
    end
  end

  private
  def item_params item, index
    {
      "L_PAYMENTREQUEST_0_NAME#{index}" => item.name,
      "L_PAYMENTREQUEST_0_DESC#{index}" => item.description,
      "L_PAYMENTREQUEST_0_AMT#{index}" => item.amount,
      "L_PAYMENTREQUEST_0_QTY#{index}" => item.quantity
    }
  end

end
