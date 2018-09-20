class CreateTableMatch < ActiveRecord::Migration[5.2]
  def change
    create_table :matches do |t|
      t.integer :team1_id
      t.integer :team2_id
      t.boolean :team1_winner
      t.timestamps
    end
  end
end
