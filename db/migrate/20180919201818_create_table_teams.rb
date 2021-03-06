class CreateTableTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :teams do |t|
      t.string :name, :unique=>true
      t.integer :player1_id
      t.integer :player2_id
      t.integer :score
      t.timestamps
    end
  end
end
