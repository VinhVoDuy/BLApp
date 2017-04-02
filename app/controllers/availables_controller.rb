class AvailablesController < ApplicationController
  def create
    room_type = RoomType.find_by_id params[:room_type_id]
    checking_params = { room_type: room_type, quantity: params[:quantity], start_date:  params[:start_date], end_date: params[:end_date] }
    checker = AvailableRoom.new checking_params
    redirect_to root_url(checking_params.merge(error: checker.error)) unless checker.run
  end
end
