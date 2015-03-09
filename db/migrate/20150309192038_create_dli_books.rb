class CreateDliBooks < ActiveRecord::Migration
  def change
    create_table :dli_books do |t|
     t.integer :author_id
     t.string :book_title
     t.integer :publisher_id
     t.integer :language_id
     t.timestamps
   end
 end
end
