class CreateBarns < ActiveRecord::Migration[5.2]
  def change
    create_table :barns do |t|
      t.string :location
      t.string :name
      t.boolean :arena
      t.boolean :trail_access
      t.integer :monthly_fee
      t.integer :stalls
      t.boolean :vacancy
    end
  end
end
