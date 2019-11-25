class CreatePages < ActiveRecord::Migration[5.0]
  def change
    create_table :pages do |t|
      t.string :index
      t.string :show

      t.timestamps
    end
  end
end
