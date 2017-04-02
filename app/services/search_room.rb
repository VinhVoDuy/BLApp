class SearchRoom
  def initialize search_params
    @search_params = search_params
    extract_params
  end

  def extract_params
    get_room_type
    get_checkin_date
    get_checkout_date
    get_guests
  rescue ArgumentError => e
    @error = e.message
  end

  def get_room_type
    @room_type = RoomType.find @search_params[:room_type_id] if @search_params[:room_type_id].present?
  end

  def get_checkin_date
    @checkin_date = Date.strptime @search_params[:checkin], '%d/%m/%Y'
  end

  def get_checkout_date
    @checkout_date = Date.strptime @search_params[:checkout], '%d/%m/%Y'
  end

  def get_guests
    @guests = @search_params[:guests].to_i
    @guests = 1 if @guests == 0
  end


  def run
    return false if @error.persent?
    if @room_type
      search_for_a_room_type
    else
      search_all
    end
  end

  def search_for_a_room_type
    (@guests / @room_type.capacity.to_f).ceil
  end

end
