class CreatePictures < ActiveRecord::Migration[5.2]
  def change
    create_table :pictures do |t|
      t.references :book, foreign_key: true
      t.string :image
      t.string :title
      t.text :description

      t.timestamps
    end
  end
end
