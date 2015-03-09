class CreateDliBookDescriptions < ActiveRecord::Migration
  def change
    create_table :dli_book_descriptions do |t|
      t.integer :book_id
      t.string :contributor
      t.string :scanning_center
      t.string :barcode
      t.string :copyright
      t.string :rights
      t.date :year
      t.integer :pages
      t.string :url
      t.integer :no_of_pages
      t.string :vendor
      t.string :subject
      t.date :digital_pub_date
      t.string :link
      t.integer :unnumber_pages
      t.string :identifier
      t.timestamps
    end
    add_index :dli_book_descriptions, :book_id
  end
end
