class CreateDeals < ActiveRecord::Migration[5.2]
  def change
    create_table :deals do |t|
      t.references :book, foreign_key: true
      t.string :name
      t.string :contact

      t.timestamps
    end
  end
end
