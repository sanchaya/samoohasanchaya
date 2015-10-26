class CreateFuelWords < ActiveRecord::Migration
  def change
    create_table :fuel_words do |t|
      t.integer :language_id
      t.integer :fuel_module_id
      t.string :name
      t.text :context
      t.timestamps
    end
    add_index :fuel_words, :name
  end
end
