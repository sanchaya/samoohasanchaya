class AddBooleanColumnToBooks < ActiveRecord::Migration
  def change
    add_column :books, :reviewed, :boolean
  end
end
