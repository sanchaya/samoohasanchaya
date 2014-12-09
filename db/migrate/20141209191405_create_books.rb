class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :author
      t.string :book_title
      t.string :publisher
      t.integer :language_id

      t.timestamps
    end
  end
end
