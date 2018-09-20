class AddEmployeeIdToPlayer < ActiveRecord::Migration[5.2]
  def change
    add_column :player, :employee_id, :integer
    add_index :player, :employee_id, :unique => true
  end
end
