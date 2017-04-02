class Admin::RoomTypesController < AdminController
  def index

  end

  def new
    @room_type = RoomType.new
    @room_type.room_images.build
    flash[:success] = 'Created successfully'
  end

  def edit
    @room_type = RoomType.friendly.find(params[:id])
  end

  def create
    @room_type = RoomType.new(room_type_params)
    return redirect_after_save
  end

  def update
    @room_type = RoomType.friendly.find(params[:id])
    @room_type.assign_attributes(room_type_params)
    flash[:success] = 'Updated successfully'
    return redirect_after_save
  end

  def redirect_after_save
    if @room_type.save
      redirect_to action: :edit
    else
      flash.now[:danger] = @room_type.errors.full_messages.join('. ')
      render :new
    end
  end

  private
  def room_type_params
    params.require(:room_type).permit(:name, :title, :description, :fake_features, :price, :capacity, room_images_attributes: [:id, :image, :_destroy], room_prices_attributes: [:id, :price, :start_date, :end_date, :_destroy], room_capacities_attributes: [:id, :capacity, :start_date, :end_date, :_destroy])
  end
end
