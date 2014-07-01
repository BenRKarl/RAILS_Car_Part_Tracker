class CreateCars < ActiveRecord::Migration
  def change
    create_table :cars do |t|
      t.string :name
      t.string :VIN
      t.string :make
      t.string :model

      t.timestamps
    end
  end
end
