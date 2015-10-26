class CreateFuelModules < ActiveRecord::Migration
  def change
    create_table :fuel_modules do |t|
      t.string :name
      t.timestamps
    end
    add_index :fuel_modules, :name
  end
end
