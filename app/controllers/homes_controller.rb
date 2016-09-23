class HomesController < ApplicationController
  def show
    @merchant_id = ENV['paypal_merchant_id']
  end
end
