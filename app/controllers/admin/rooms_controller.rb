class Admin::RoomsController < AdminController
  def index
  end

  def new
    @room = Room.new(room_type: RoomType.first)
  end

  def create
    @room = Room.new(room_params)
    if @room.save
      redirect_to action: :index
    else
      flash.now[:danger] = @room.errors.full_messages.join('. ')
      render :new
    end
  end

  private
  def room_params
    params.require(:room).permit(:room_type_id, :number)
  end

end
