class ToursController < ApplicationController
  layout 'application'
  def index

  end

  def show
    @tour = Tour.find params[:id]
  end

end
