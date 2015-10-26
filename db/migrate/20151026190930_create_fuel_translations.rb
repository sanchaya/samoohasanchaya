class CreateFuelTranslations < ActiveRecord::Migration
  def change
    create_table :fuel_translations do |t|
     t.integer :language_id
     t.integer :user_id
     t.integer :fuel_word_id
     t.string :name
     t.text :context
     t.integer :vote
     t.timestamps
   end
   add_index :fuel_translations, :name
 end
end
