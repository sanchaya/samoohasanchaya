class CreateKannadaBookCategories < ActiveRecord::Migration
  def change
    create_table :kannada_book_categories do |t|
      t.references :kannada_book
      t.references :category
      t.timestamps null: false
    end
  end
end
