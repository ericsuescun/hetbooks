class CreateBooksSpecialitiesJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :books, :specialities do |t|
      t.belongs_to :book
      t.belongs_to :speciality
    end
  end
end
