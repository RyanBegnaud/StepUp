class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.integer :user_id
      t.string :name
      t.integer :goal_amount
      t.integer :goal_progress, default: 0
      t.string :uom

      t.timestamps
    end
  end
end
