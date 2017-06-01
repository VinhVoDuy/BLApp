class Admin::ToursController < AdminController
  def index
  end

  def new
    @tour = Tour.new
  end

  def create
    @tour = Tour.new(tour_params)
    if @tour.save
      redirect_to action: :index
    else
      flash.now[:danger] = @tour.errors.full_messages.join('. ')
      render :new
    end
  end

  def edit
    @tour = Tour.find params[:id]
  end

  def update
    @tour = Tour.find params[:id]
    if @tour.update_attributes(tour_params)
      redirect_to action: :index
    else
      flash.now[:danger] = @tour.errors.full_messages.join('. ')
      render :edit
    end
  end

  private
  def tour_params
    params.require(:tour).permit(:name, :start_time, :end_time, :price, :included, :short_description, private_tour_pricing: [], tour_images_attributes: [:id, :image, :description, :primary, :_destroy])
  end

end
