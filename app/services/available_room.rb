class AvailableRoom
  class InvalidData < StandardError; end;
  attr_reader :error, :result
  def initialize checking_params
    @room_type = checking_params[:room_type]
    @quantity = checking_params[:quantity]
    @start_date = checking_params[:start_date]
    @end_date = checking_params[:end_date]
  end

  def run
    check_data
    if @room_type
      return check_for_a_room
    else
      return check_for_all_rooms
    end
  rescue InvalidData
    @error = 'Invalid Data'
    return false
  end

  def check_data
    @start_date = Time.parse(@start_date).to_date
    @end_date = Time.parse(@end_date).to_date
  rescue Exception
    raise InvalidData
  end

  def check_for_a_room
    not_enough_remainings = @room_type.remainings.where('? <= date AND date < ? AND quantity_left < ?', @start_date, @end_date, @quantity)
    if not_enough_remainings.present?
      @error = "This room is fully booked on #{ not_enough_remainings.pluck(:date).map{|d| d.strftime("%a %b #{d.day.ordinalize}")}.to_sentence }"
      return false
    elsif @room_type.quantity < @quantity.to_i
      @error = "Please call us for a large number of guests"
      return false
    else
      return true
    end
  end

  def check_for_all_rooms
    full_rooms = RoomType.joins(:remainings).where('? <= remainings.date AND remainings.date < ?', @start_date, @end_date).where('quantity_left <= 0').or('capacity <= 0')
    if RoomType.where.not(id: full_rooms.distinct.pluck(:id)).blank?
      @error = "All rooms is fully booked"
      return false
    else
      @result = RoomType.where.not(id: full_rooms.pluck(:id))
      return true
    end
  end
end
