class CreateBookDescriptions < ActiveRecord::Migration
  def change
    create_table :book_descriptions do |t|
      t.string :date_accessioned
      t.string :date_available
      t.string :date_issued
      t.string :link
      t.string :rights
      t.string :subjects
      t.string :file_name
      t.string :file_size
      t.string :category
      t.integer :book_id

      t.timestamps
    end
  end
end
