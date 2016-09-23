class SetExpressCheckout
  def initialize

  end

  def default_params
    { 
      USER: ENV['paypal_user_name'],
      PWD: ENV['paypal_password'],
      SIGNATURE: ENV['paypal_signature'],
      METHOD: 'SetExpressCheckout',
      VERSION: 204,
      PAYMENTREQUEST_0_PAYMENTACTION: 'Authorization',
      PAYMENTREQUEST_0_CURRENCYCODE: 'USD',
      cancelUrl: '',
      returnUrl: '',
      SOLUTIONTYPE: 'Sole',
      LANDINGPAGE: 'Billing',
      USERSELECTEDFUNDINGSOURCE: 'CreditCard'
    }
  end

  def item_params index, item
    {
      "L_PAYMENTREQUEST_0_NAME#{index}" => item.name,
      "L_PAYMENTREQUEST_0_DESC#{index}" => item.description,
      "L_PAYMENTREQUEST_0_AMT#{index}" => item.item_price,
      "L_PAYMENTREQUEST_0_QTY#{index}" => item.quantity
    }
  end
end
