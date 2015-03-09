class CreateDliBookTranslations < ActiveRecord::Migration
  def change
    create_table :dli_book_translations do |t|
     t.integer :language_id
     t.integer :book_id
     t.string :book_title
     t.integer :user_id
     t.boolean :reviewed, default: false
     t.timestamps
   end
 end
end
