class CreateAuthors < ActiveRecord::Migration[5.2]
  def change
    create_table :authors do |t|
      t.string :name
      t.string :lastname
      t.string :university
      t.string :job_title
      t.string :company

      t.timestamps
    end
  end
end
