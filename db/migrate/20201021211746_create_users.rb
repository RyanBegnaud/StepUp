class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.array :goals
      t.array :goals_completed

      t.timestamps
    end
  end
end
