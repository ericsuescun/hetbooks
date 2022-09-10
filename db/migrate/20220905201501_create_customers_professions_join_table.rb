class CreateCustomersProfessionsJoinTable < ActiveRecord::Migration[5.2]
  def change
    create_join_table :customers, :professions do |t|
      t.belongs_to :customer
      t.belongs_to :profession
    end
  end
end
