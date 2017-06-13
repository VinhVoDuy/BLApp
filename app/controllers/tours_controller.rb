class ToursController < ApplicationController
  layout 'application'
  def index

  end

  def show
    @tour = Tour.friendly.find params[:id]
  end

end
