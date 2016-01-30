class CreateBookReviews < ActiveRecord::Migration
  def change
    create_table :book_reviews do |t|
      t.integer :book_id
      t.boolean :reviewed

      t.timestamps
    end
  end
end
