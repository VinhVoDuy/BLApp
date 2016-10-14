class HomesController < ApplicationController
  layout false
  layout 'application', except: :show2
  def show
    @merchant_id = ENV['paypal_merchant_id']
  end

  def show2
  end
end
