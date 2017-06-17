class PromotionsController < ApplicationController
  def show
    @promotion = Promotion.friendly.find(params[:id])
  end
end
