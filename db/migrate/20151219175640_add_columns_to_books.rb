class AddColumnsToBooks < ActiveRecord::Migration
  def change
    add_column :dli_book_descriptions, :others, :text, :limit => 4294967295
    add_column :book_descriptions, :others, :text, :limit => 4294967295
  end
end
