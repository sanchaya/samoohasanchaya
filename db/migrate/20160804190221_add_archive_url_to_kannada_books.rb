class AddArchiveUrlToKannadaBooks < ActiveRecord::Migration
  def change
    add_column :kannada_books, :archive_url, :text
  end
end
