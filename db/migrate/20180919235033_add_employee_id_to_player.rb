class AddEmployeeIdToPlayer < ActiveRecord::Migration[5.2]
  def change
    add_column :players, :employee_id, :integer
    add_index :players, :employee_id, :unique => true
  end
end
