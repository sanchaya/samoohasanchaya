class CreateWikiBooks < ActiveRecord::Migration
  def change
    create_table :wiki_books do |t|
      t.string :book_name
      t.string :library
      t.integer :book_id
      t.boolean :book_present
      t.timestamps
    end
  end
end
