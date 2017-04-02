module Duration
  END_OF_DURATION = Date.new(2050, 1, 1)
  extend ActiveSupport::Concern
  included do
    validates_presence_of :start_date
    validate :not_overlap
    validate :end_date_must_be_greater_than_start_date


    before_validation :set_end_date, unless: :end_date

    scope :now, -> { where('start_date <= :today AND :today <= end_date', today: Date.today).first }

    def set_end_date
      self.end_date = Duration::END_OF_DURATION
    end


    def end_date_must_be_greater_than_start_date
      errors.add(:end_date, 'should be greater than or equal to start date') if start_date && end_date && start_date > end_date
    end

    def not_overlap
      errors.add(:start_and_end_time, 'should not overlap') if room_type.send(self.class.name.underscore.pluralize).where.not(id: id).exists?(['start_date <= :end_date AND end_date >= :start_date', start_date: start_date, end_date: end_date])
    end

    def expired?
      if start_date && end_date
        (start_date <= end_date) && end_date < Date.today
      else
        false
      end
    end
  end
end
