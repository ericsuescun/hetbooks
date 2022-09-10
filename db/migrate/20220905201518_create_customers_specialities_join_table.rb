class CreateCustomersSpecialitiesJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :customers, :specialities do |t|
      t.belongs_to :customer
      t.belongs_to :speciality
    end
  end
end
