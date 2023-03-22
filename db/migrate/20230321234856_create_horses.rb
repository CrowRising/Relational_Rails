class CreateHorses < ActiveRecord::Migration[5.2]
  def change
    create_table :horses do |t|
      t.string :name
      t.string :breed
      t.integer :age
      t.boolean :trail_user
      t.boolean :arena_user
      t.boolean :paid
      t.references :barn, foreign_key: true

      t.timestamps
    end
  end
end
