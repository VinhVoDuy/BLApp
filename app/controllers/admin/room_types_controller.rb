class Admin::RoomTypesController < AdminController
  def index

  end

  def new
    @room_type = RoomType.new
    @room_type.room_images.build
  end

  def edit
    @room_type = RoomType.find(params[:id])
  end

  def create
    @room_type = RoomType.new(room_type_params)
    return redirect_after_save
  end

  def update
    @room_type = RoomType.find(params[:id])
    @room_type.assign_attributes(room_type_params)
    return redirect_after_save
  end

  def redirect_after_save
    if @room_type.save
      redirect_to action: :index
    else
      flash.now[:danger] = @room_type.errors.full_messages.join('. ')
      render :new
    end
  end

  private
  def room_type_params
    params.require(:room_type).permit(:name, :title, :description, :fake_features, :price, :total_room, room_images_attributes: [:id, :image, :_destroy])
  end
end
