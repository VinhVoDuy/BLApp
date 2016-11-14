require 'rails_helper'
describe SetExpressCheckout do
  before do
    @reservation = create(:reservation)
    @items_params = SetExpressCheckout.new(@reservation.reload).items_params
  end

  describe 'item_params' do
    it 'works' do
      expect(@items_params['L_PAYMENTREQUEST_0_NAME0']).to be_present
      expect(@items_params['L_PAYMENTREQUEST_0_DESC0']).to be_present
      expect(@items_params['L_PAYMENTREQUEST_0_AMT0']).to be_present
      expect(@items_params['L_PAYMENTREQUEST_0_QTY0']).to be_present
      expect(@items_params['L_PAYMENTREQUEST_0_NAME1']).to be_present
      expect(@items_params['L_PAYMENTREQUEST_0_DESC1']).to be_present
      expect(@items_params['L_PAYMENTREQUEST_0_AMT1']).to be_present
      expect(@items_params['L_PAYMENTREQUEST_0_QTY1']).to be_present

    end
  end

  describe 'have url' do
    it 'works' do
      token = SetExpressCheckout.new(@reservation).run
      expect(token).to be_present
    end
  end
end
