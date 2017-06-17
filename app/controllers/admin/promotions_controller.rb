class Admin::PromotionsController < AdminController
  def index

  end

  def new
    @promotion = Promotion.new
  end

  def create
    @promotion = Promotion.new(promotion_params)
    if @promotion.save
      redirect_to action: :index
    else
      flash.now[:danger] = @promotion.errors
      render :new
    end
  end

  def edit
    @promotion = Promotion.friendly.find(params[:id])
  end

  def update
    @promotion = Promotion.friendly.find(params[:id])
    if @promotion.update_attributes(promotion_params)
      redirect_to action: :edit
    else
      flash.now[:danger] = @promotion.errors
      render :edit
    end

  end

  def destroy
    Promotion.friendly.find(params[:id]).destroy
    redirect_to action: :index
  end

  private
  def promotion_params
    params.require(:promotion).permit(:name, :code, :percentage_off, :amount_off, :image, :start_time, :end_time, :description, :published)
  end
end
