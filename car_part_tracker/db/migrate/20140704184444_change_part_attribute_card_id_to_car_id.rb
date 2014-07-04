class ChangePartAttributeCardIdToCarId < ActiveRecord::Migration
  def change
    rename_column :parts, :card_id, :car_id
  end
end
