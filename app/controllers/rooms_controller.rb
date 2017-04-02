class RoomsController < ApplicationController
  layout 'application'
  def show
    @room = RoomType.friendly.find params[:id]
  end


  def index

  end
end
