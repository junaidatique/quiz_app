class AddRoleCdToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :role_cd, :integer
  end
end
