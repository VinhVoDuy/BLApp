class HomesController < ApplicationController
  layout false
  layout 'application', except: :show2
  def show
    @merchant_id = ENV['paypal_merchant_id']
    @last_book_time = Setting.last_book_time
  end

  def set_time
    if params[:room_id].present?
      room = RoomType.find(params[:room_id])
      room.update_attributes(last_book_time: Time.now)
    else
      Setting.last_book_time = Time.now
    end
    render nothing: true
  end

  def show2
  end
end
