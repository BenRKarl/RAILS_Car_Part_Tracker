class CreateParts < ActiveRecord::Migration
  def change
    create_table :parts do |t|
      t.string :name
      t.string :type
      t.string :part_number
      t.string :repair_details
      t.integer :card_id

      t.timestamps
    end
  end
end
