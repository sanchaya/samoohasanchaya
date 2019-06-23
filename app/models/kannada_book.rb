class KannadaBook < ActiveRecord::Base

  has_many :kannada_book_categories
  has_many :categories, through: :kannada_book_categories
  validates_presence_of :name, :author, :publisher


  def self.category_books(category_id)
    KannadaBook.includes(:categories).where(categories: {id: category_id})
  end

  def self.to_csv
    column_names = KannadaBook.column_names
    CSV.generate do |csv|
      csv << column_names
      all.each do |book|
        csv <<  column_names.map{|column| book.send(column) }
      end
    end
  end
end
