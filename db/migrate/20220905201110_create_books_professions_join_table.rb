class CreateBooksProfessionsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :books, :professions do |t|
      t.belongs_to :book
      t.belongs_to :profession
    end
  end
end
