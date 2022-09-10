class Speciality < ApplicationRecord
  has_many :specialities
  has_many :books

  belongs_to :customer, optional: true
  belongs_to :book, optional: true

  before_save { self.title.to_s.upcase! }
end