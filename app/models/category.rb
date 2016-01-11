class Category < ActiveRecord::Base
  has_many :books, :through => :book_categories
  has_many :book_categories
  has_many :dli_books, :through => :dli_book_categories
  has_many :dli_book_categories

  def self.to_csv
  CSV.generate do |csv|
    csv << ['Category']
    all.each do |cat|
      csv << [cat.kn]
    end
  end
end

end
