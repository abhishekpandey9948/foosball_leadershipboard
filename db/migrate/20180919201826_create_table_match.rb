class CreateTableMatch < ActiveRecord::Migration[5.2]
  def change
    create_table :match do |t|
      t.integer :team1_id
      t.integer :team2_id
      t.boolean :team1_winner
      t.integer :winner_up_points
      t.timestamps
    end
  end
end
