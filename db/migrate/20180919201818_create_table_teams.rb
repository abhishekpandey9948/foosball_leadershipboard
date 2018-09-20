class CreateTableTeams < ActiveRecord::Migration[5.2]
  def change
    create_table :team do |t|
      t.string :name
      t.integer :status
      t.integer :player1_id
      t.integer :player2_id

      t.timestamps
    end
  end
end
