class ChangeYearType < ActiveRecord::Migration
    def up
    change_column :dli_book_descriptions, :year, :integer
  end

  def down
    change_column :dli_book_descriptions, :year, :date
  end
end
