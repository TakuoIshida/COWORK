class AddRoleToUsers < ActiveRecord::Migration[5.0]
  def up
    add_column :users, :role, :integer,default: 0
  end
  
  def down
    add_column :users, :role, :integer,default: 0
  end
end
