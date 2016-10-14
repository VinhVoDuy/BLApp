class DoExpressCheckout
  attr_reader :transaction_id
  def initialize payer_id, transaction
    @payer_id = payer_id
    @transaction = transaction
  end

  def run
    response_data = RestClient.post(ENV['paypal_endpoint'], do_checkout_params)
    hash_url = CGI::parse(response_data.body)
    @transaction_id = hash_url['PAYMENTINFO_0_TRANSACTIONID'].first
  end

  def do_checkout_params
    {
      USER: ENV['paypal_user_name'],
      PWD: ENV['paypal_password'],
      SIGNATURE: ENV['paypal_signature'],
      METHOD: 'DoExpressCheckoutPayment',
      VERSION: ENV['paypal_api_version'],
      TOKEN: @transaction.token,
      PAYERID: @payer_id
    }.merge(SetExpressCheckout.new(@transaction.reservation).payment_params)
  end
end
