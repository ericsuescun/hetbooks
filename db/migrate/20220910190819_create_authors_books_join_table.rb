class CreateAuthorsBooksJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :authors, :books do |t|
      t.belongs_to :authors
      t.belongs_to :books
    end
  end
end
