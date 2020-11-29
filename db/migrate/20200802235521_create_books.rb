class CreateBooks < ActiveRecord::Migration[5.2]
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.string :discipline
      t.string :topic
      t.string :specialty
      t.string :specialty2
      t.decimal :price
      t.integer :edition
      t.integer :pub_year
      t.string :isbn_10
      t.string :isbn_13
      t.integer :pages
      t.string :size
      t.string :cover
      t.string :volumes
      t.text :index

      t.timestamps
    end
  end
end
