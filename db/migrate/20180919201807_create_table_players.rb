class CreateTablePlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :players do |t|
      t.string :name
      t.integer :score
      t.timestamps
    end
  end
end
