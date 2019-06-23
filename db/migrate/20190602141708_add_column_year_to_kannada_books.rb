class AddColumnYearToKannadaBooks < ActiveRecord::Migration
  def change
    add_column :kannada_books, :year, :string
  end
end
