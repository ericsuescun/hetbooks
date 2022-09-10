class Book < ApplicationRecord
	has_and_belongs_to_many :professions, optional: true
	has_and_belongs_to_many :specialities, optional: true
  has_and_belongs_to_many :authors, optional: true

	require 'csv'

	def self.import(file)
		CSV.foreach(file.path, :col_sep => (";"), headers: true, encoding: 'iso-8859-1:utf-8') do |row|
			data = row.to_hash.with_indifferent_access
      next if data[:profession].blank?

      profession = Profession.find_or_create_by(title: data[:profession].to_s.upcase)
      speciality = Speciality.find_or_create_by(title: data[:speciality].to_s.upcase)
      speciality2 = Speciality.find_or_create_by(title: data[:speciality2].to_s.upcase)
      author = Author.find_or_create_by(name: data[:author].to_s.upcase)

      book = Book.new(title: data[:fullname],
      								description: data[:description],
      								topic: data[:topic],
      								price: data[:price],
      								edition: data[:edition],
      								pub_year: data[:pub_year],
      								isbn_10: data[:isbn_10],
      								isbn_13: data[:isbn_13],
      								pages: data[:pages],
      								size: data[:size],
      								cover: data[:cover],
      								volumes: data[:volumes],
      								index: data[:index]
      	)
      book.authors << author
			book.professions << profession
      book.specialities << speciality
      book.specialities << speciality2
      book.save!
		end
	end

	has_many :pictures, dependent: :destroy

  before_save { self.title.to_s.upcase! }
  before_save { self.profession.to_s.upcase! }
  before_save { self.topic.to_s.upcase! }

end
