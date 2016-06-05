class CreateKannadaBooks < ActiveRecord::Migration
  def change
    create_table :kannada_books do |t|
      t.string :name
      t.string :author
      t.string :publisher
      t.string :library
      t.string :book_link

      t.timestamps
    end
  end
end
