class CreateBookTranslations < ActiveRecord::Migration
  def change
    create_table :book_translations do |t|
      t.integer :language_id
      t.integer :book_id
      t.string :book_title
      t.integer :user_id
      t.timestamps
    end
  end
end
