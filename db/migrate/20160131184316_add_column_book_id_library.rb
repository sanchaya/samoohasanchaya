class AddColumnBookIdLibrary < ActiveRecord::Migration
  def change
    add_column :wiki_users, :book_id, :integer
    add_column :wiki_users, :library, :string
    add_index :wiki_users, :book_id
  end
end
