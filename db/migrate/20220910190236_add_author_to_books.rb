class AddAuthorToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :author, :string, default: ''
  end
end
