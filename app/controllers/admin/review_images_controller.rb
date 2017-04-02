class Admin::ReviewImagesController < AdminController
  def index
  end

  def destroy
    ReviewImage.find(params[:id]).destroy
    redirect_to action: :index
  end

  def create
    ReviewImage.create(review_params)
    redirect_to action: :index
  end

  def edit
    @review = ReviewImage.find(params[:id])
  end

  def update
    review = ReviewImage.find(params[:id])
    review.update_attributes(review_params)
    redirect_to action: :index
  end
  private

  def review_params
    params.require(:review_image).permit(:image, :name, :content)
  end

end
