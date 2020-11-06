class CreateArmies < ActiveRecord::Migration[6.0]
  def change
    create_table :armies do |t|
      t.string :army_name
      t.string :faction
      t.integer :unit_count
      t.integer :user_id
    end
  end
end
