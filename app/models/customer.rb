class Customer < ApplicationRecord
  belongs_to :user

  default_scope -> { order(prof_title: :asc, specialty: :asc, fullname: :asc) }

  require 'csv'

  def self.import(file)
  	CSV.foreach(file.path, :col_sep => (";"), headers: true, encoding: 'iso-8859-1:utf-8') do |row|
  		Customer.create!(row.to_hash.merge(user_id: 1))
  	end
  end

  before_save { self.fullname.to_s.upcase! }
  before_save { self.prof_title.to_s.upcase! }
  before_save { self.specialty.to_s.upcase! }

end