class Setting < ApplicationRecord
  def self.last_book_time= value
    last_book_time = Setting.find_or_create_by(name: 'last_book_time')
    last_book_time.update_attributes value: value.to_i
  end

  def self.last_book_time
    last_book_time = Setting.find_or_create_by(name: 'last_book_time')
    last_book_time.update_attributes(value: Time.now.to_i) unless last_book_time.value.to_i > 0
    Time.at(last_book_time.value.to_i)
  end
end
