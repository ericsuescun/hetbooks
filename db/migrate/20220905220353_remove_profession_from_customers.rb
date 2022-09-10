class RemoveProfessionFromCustomers < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :profession
  end
end
