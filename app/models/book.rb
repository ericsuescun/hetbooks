class Book < ApplicationRecord

	require 'csv'

	def self.import(file)
		CSV.foreach(file.path, :col_sep => (";"), headers: true, encoding: 'iso-8859-1:utf-8') do |row|
			Book.create!(row.to_hash)
		end
	end

	has_many :pictures, dependent: :destroy

end
