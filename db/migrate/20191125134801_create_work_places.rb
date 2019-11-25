class CreateWorkPlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :work_places do |t|
      t.text :name
      t.text :region
      t.integer :tel
      t.text :url
      t.string :image
      t.integer :user_id

      t.timestamps
    end
  end
end
