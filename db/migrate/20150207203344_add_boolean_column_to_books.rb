class AddBooleanColumnToBooks < ActiveRecord::Migration
  def change
    add_column :book_translations, :reviewed, :boolean
  end
end
