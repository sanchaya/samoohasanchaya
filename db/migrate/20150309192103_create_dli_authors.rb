class CreateDliAuthors < ActiveRecord::Migration
  def change
    create_table :dli_authors do |t|
     t.string :name
     t.integer :language_id
     t.timestamps
   end
 end
end
