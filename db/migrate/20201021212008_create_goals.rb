class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals do |t|
      t.integer :user_id
      t.integer :amount
      t.string :uom

      t.timestamps
    end
  end
end
