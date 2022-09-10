class ChangeSpecialtyNameFromCustomers < ActiveRecord::Migration[5.2]
  def change
    rename_column :customers, :specialty, :speciality
    rename_column :customers, :specialty2, :speciality2
    rename_column :customers, :prof_title, :profession
  end
end
