class RoomsController < ApplicationController
  def show
    @room = RoomType.friendly.find params[:id]
  end


  def index

  end
end
