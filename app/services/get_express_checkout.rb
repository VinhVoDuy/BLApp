class GetExpressCheckout
  attr_reader :payer_id
  def initialize token
    @token = token
  end

  def run
    response_data = RestClient.post(ENV['paypal_endpoint'], get_checkout_params)
    hash_url = CGI::parse(response_data.body)
    @payer_id = hash_url['PAYERID'].first
  end

  def get_checkout_params
    {
      USER: ENV['paypal_user_name'],
      PWD: ENV['paypal_password'],
      SIGNATURE: ENV['paypal_signature'],
      METHOD: 'GetExpressCheckoutDetails',
      VERSION: ENV['paypal_api_version'],
      TOKEN: @token
    }
  end
end
