class AddEmployeeCodeToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :employee_code, :string
  end
end
