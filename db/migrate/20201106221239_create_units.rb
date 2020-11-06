class CreateUnits < ActiveRecord::Migration[6.0]
  def change
    create_table :units do |t|
      t.string :unit_name
      t.string :faction
      t.integer :model_count
      t.integer :user_id
      t.integer :army_id
    end
  end
end
