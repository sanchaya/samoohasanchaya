class CreateDliBookCategories < ActiveRecord::Migration
  def change
    create_table :dli_book_categories do |t|
     t.integer :dli_book_id
     t.integer :category_id
     t.timestamps
   end
 end
end
