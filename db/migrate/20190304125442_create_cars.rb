class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :location
      t.string :description
      t.integer :capacity
      t.integer :price
      t.references :user, foreign_key: true
      t.string :make
      t.string :model
      t.boolean :ac
      t.string :fuel
      t.string :consumption
      t.integer :min_age
      t.integer :year
      t.integer :kilometers


      t.timestamps
    end
  end
end
