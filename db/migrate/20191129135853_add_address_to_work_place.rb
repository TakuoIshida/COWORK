class AddAddressToWorkPlace < ActiveRecord::Migration[5.2]
  def up
    add_column :work_places, :address, :text
    add_column :work_places, :opentime, :datetime
    add_column :work_places, :closetime, :datetime
  end
  
  def down
    add_column :work_places, :address, :text
    add_column :work_places, :opentime, :datetime
    add_column :work_places, :closetime, :datetime
  end
end
