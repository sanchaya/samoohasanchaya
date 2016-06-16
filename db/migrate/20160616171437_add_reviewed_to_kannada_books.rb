class AddReviewedToKannadaBooks < ActiveRecord::Migration
  def change
    add_column :kannada_books, :reviewed, :boolean, default: false
  end
end
