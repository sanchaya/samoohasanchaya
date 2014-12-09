class CreateBookTranslations < ActiveRecord::Migration
  def change
    create_table :book_translations do |t|
      t.integer :language_id
      t.integer :book_id
      t.string :author
      t.string :book_title
      t.string :publisher
      t.integer :user_id
      t.timestamps
    end
  end
end
