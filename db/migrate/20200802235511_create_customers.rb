class CreateCustomers < ActiveRecord::Migration[5.2]
  def change
    create_table :customers do |t|
      t.references :user, foreign_key: true
      t.string :fullname
      t.string :cel
      t.string :tel
      t.string :address
      t.string :city
      t.string :email
      t.string :prof_title
      t.string :specialty
      t.string :specialty2

      t.timestamps
    end
  end
end
