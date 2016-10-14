class PaypalsController < ApplicationController
  def show
    reservation = Reservation.find(params[:reservation_id])
    transaction = PaypalTransaction.find_or_create_by!(reservation: reservation)
    token = SetExpressCheckout.new(reservation).run
    transaction.update_attributes!(token: token)
    redirect_to "https://www.sandbox.paypal.com/checkoutnow?token=#{token}"
  end

  def success
    token = params[:token]
    payer_id = params[:PayerID]
    real_payer_id = GetExpressCheckout.new(token).run
    transaction = PaypalTransaction.available_for_token(token)
    paypal_transaction_id = DoExpressCheckout.new(payer_id, transaction).run if real_payer_id == payer_id
    transaction.update_attributes!(payer_id: real_payer_id, transaction_id: paypal_transaction_id)
    redirect_to root_url
  end

  def failed
  end
end
