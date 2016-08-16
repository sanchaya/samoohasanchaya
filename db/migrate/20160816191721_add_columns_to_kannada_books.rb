class AddColumnsToKannadaBooks < ActiveRecord::Migration
  def change
    add_column :kannada_books, :wikimedia_url, :text
    add_column :kannada_books, :wikisource_url, :text
  end
end
