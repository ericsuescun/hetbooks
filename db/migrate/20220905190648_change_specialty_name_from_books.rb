class ChangeSpecialtyNameFromBooks < ActiveRecord::Migration[5.2]
  def change
    rename_column :books, :specialty, :speciality
    rename_column :books, :specialty2, :speciality2
    rename_column :books, :discipline, :profession
  end
end
