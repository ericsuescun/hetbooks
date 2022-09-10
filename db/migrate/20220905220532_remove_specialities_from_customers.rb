class RemoveSpecialitiesFromCustomers < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :speciality
    remove_column :customers, :speciality2
  end
end
