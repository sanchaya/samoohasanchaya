class CreateDliBookReviews < ActiveRecord::Migration
  def change
    create_table :dli_book_reviews do |t|
      t.integer :dli_book_id
      t.boolean :reviewed

      t.timestamps
    end
    # add_index :dli_book_reviews, dli_book_id
  end
end
