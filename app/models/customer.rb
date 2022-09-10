class Customer < ApplicationRecord
  belongs_to :user

  has_and_belongs_to_many :professions
  has_and_belongs_to_many :specialities

  require 'csv'

  def self.import(file)
  	CSV.foreach(file.path, :col_sep => (";"), headers: true, encoding: 'iso-8859-1:utf-8') do |row|
      data = row.to_hash.with_indifferent_access
      next if data[:profession].blank?

      profession = Profession.find_or_create_by(title: data[:profession].to_s.upcase)
      speciality = Speciality.find_or_create_by(title: data[:speciality].to_s.upcase)
      speciality2 = Speciality.find_or_create_by(title: data[:speciality2].to_s.upcase)
      customer = Customer.new(fullname: data[:fullname],
                              cel: data[:cel],
                              tel: data[:tel],
                              address: data[:address],
                              city: data[:city],
                              email: data[:email],
                              user_id: 1)
      customer.professions << profession
      customer.specialities << speciality
      customer.specialities << speciality2
      customer.save!
  	end
  end

  before_save { self.fullname.to_s.upcase! }
end