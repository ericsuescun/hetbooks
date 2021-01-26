class Customer < ApplicationRecord
  belongs_to :user

  default_scope -> { order(prof_title: :asc, specialty: :asc, fullname: :asc) }

  require 'csv'

  def self.import(file)
  	CSV.foreach(file.path, :col_sep => (";"), headers: true, encoding: 'iso-8859-1:utf-8') do |row|
  		Customer.create!(row.to_hash.merge(user_id: 1))
  	end
  end

end