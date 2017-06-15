class ToursController < ApplicationController
  layout 'application'
  def index
    if params[:filter].present?
      @tours = Tour.tagged_with params[:filter]
    else
      @tours = Tour.all
    end
  end

  def show
    @tour = Tour.friendly.find params[:id]
  end

end
