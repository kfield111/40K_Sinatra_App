class ChangeArmyTableName < ActiveRecord::Migration[6.0]
  def change
    rename_column :armies, :unit_count, :army_point_cost 
  end
end
