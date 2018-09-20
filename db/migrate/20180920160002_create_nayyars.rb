class CreateNayyars < ActiveRecord::Migration[5.2]
  def change
    create_table :nayyars do |t|
      t.text :name
      t.decimal :age

      t.timestamps
    end
  end
end
