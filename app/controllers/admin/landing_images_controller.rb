class Admin::LandingImagesController < AdminController
  def index

  end

  def create
    landing_image = LandingImage.new landing_image_params
    if landing_image.save
      redirect_to action: :index
    else
      flash.now[:danger] = landing_image.errors
      render :new
    end
  end

  def new
    @landing_image = LandingImage.new
  end

  def edit
    @landing_image = LandingImage.find(params[:id])
  end

  def update
    landing_image = LandingImage.find(params[:id])
    landing_image.assign_attributes(landing_image_params)
    if landing_image.save
      redirect_to action: :index
    else
      flash.now[:danger] = landing_image.errors
      render :edit
    end
  end

  def destroy
    if LandingImage.find(params[:id]).destroy
      redirect_to action: :index
    else
      flash[:danger] = landing_image.errors
      redirect_to action: :index
    end
  end

  def landing_image_params
    params.require(:landing_image).permit(:image, :heading, :description, :url)
  end
end
