class AddColumnToKannadaBooks < ActiveRecord::Migration
  def change
    add_column :kannada_books, :rights, :text
  end
end
