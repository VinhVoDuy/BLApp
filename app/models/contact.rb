class Contact < ApplicationRecord
  validates_uniqueness_of :email
end
