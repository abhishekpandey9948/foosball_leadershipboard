class AddNameToMatch < ActiveRecord::Migration[5.2]
  def change
    add_column :match, :name, :string
  end
end
