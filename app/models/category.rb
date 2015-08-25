class Category < ActiveRecord::Base
  has_many :books, :through => :book_categories
  has_many :book_categories
  has_many :dli_books, :through => :dli_book_categories
  has_many :dli_book_categories
end
